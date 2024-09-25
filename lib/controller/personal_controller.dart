import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/personal_api.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/models/personal_details_model.dart';
import 'package:dio/dio.dart' as dio;

class PersonalController extends GetxController {
  final LandingPageController landingPageController = Get.find<LandingPageController>();
  final RxString profilePicturePathFromApi = ''.obs;
  var selectedImage = Rxn<File>();
  final RxString profilePicturePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  var personalDetails = PersonalDetailsModel().obs;
  final RxBool isAnyFieldChanged = false.obs;
  Rx<String?> selectedGender = Rx<String?>(null);
  var isGenderInvalid = false.obs;
  var genderError = ''.obs;

  final id = ''.obs;
  final dateOfBirth = Rxn<DateTime>();
  final phoneNumber = ''.obs;
  final isPhoneNumberFieldEmpty = false.obs;

  final fullNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final nidNumberController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  var initialCountryCode = 'BD'.obs;

  var selectedNidFile = Rx<File?>(null);
  final RxString nidPicturePathFromApi = ''.obs;
  var nidFileName = ''.obs;
  var nidFileSize = 0.0.obs;
  var nidFileExtension = ''.obs;
  var nidFilePath = ''.obs;
  var isNidFileSelected = true.obs;
  var isPickerActive = false.obs;  // Flag to check if picker is active
  var token = ''.obs;
  late SharedPreferences prefs;

  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  bool validateName(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validNameRegex = RegExp(r"^[a-zA-Z\s\.\,\-'’]+$");   // Define a regular expression for valid name characters (e.g., letters, spaces, and common punctuation)

    if (value.isEmpty) {
      return false;
    } else if (!validNameRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  void updateFullName(String input) {
    if (validateName(input)) {
      // fullNameController.value.text = input.trim();
      final controller = fullNameController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  void validateEmail(String input) {
    final isValidEmail = GetUtils.isEmail(input.trim());
    final cursorPosition = emailController.value.selection;  // Save cursor position

    if (isValidEmail) {
      emailController.value.text = input.trim();
    } else {
      emailController.value.text = input.trim();  // Keep the text even if invalid for now
    }

    // Restore cursor position after updating the text
    emailController.value.selection = cursorPosition;
  }

  bool validateNidNumber(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validAccountNumberRegex = RegExp(r'^\d{10,17}$');   // Define a regular expression for numbers with up to 17 digits

    if (value.isEmpty) {
      return false;
    } else if (!validAccountNumberRegex.hasMatch(value.trim())) {
      return false;
    }
    return true;
  }
  void updateNidNumber(String input) {
    if (validateNidNumber(input)) {
      final controller = nidNumberController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateOfBirth.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dateOfBirth.value) {
      dateOfBirth.value = picked;
      if (!isAnyFieldChanged.value) {
        isAnyFieldChanged.value = true;
      }
    }
  }

  String get formattedDate {
    return "${dateOfBirth.value?.day.toString().padLeft(2, '0')}/"
           "${dateOfBirth.value?.month.toString().padLeft(2, '0')}/"
           "${dateOfBirth.value?.year}";
  }

  void selectGender(String? gender) {
    if (selectedGender.value == gender) {
      selectedGender.value = null; // Unselect if the same gender is clicked
    } else {
      selectedGender.value = gender; // Select the new gender
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }
  void clearSelection() {
    selectedGender.value = null; // Clear the selection
  }
  bool validateGender() {
    if (selectedGender.value == null || selectedGender.value!.isEmpty) {
      isGenderInvalid.value = true;
      return false;
    }
    isGenderInvalid.value = false;
    return true;
  }

  bool validatePhoneNumber(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validAccountNumberRegex = RegExp(r'^\d+$');  // Regex for only digits with no length range

    if (value.isEmpty) {
      isPhoneNumberFieldEmpty.value = false;
      return false;
    } else if (!validAccountNumberRegex.hasMatch(value.trim())) {
      isPhoneNumberFieldEmpty.value = false;
      return false;
    }
    isPhoneNumberFieldEmpty.value = false;
    return true;
  }

  void updatePhoneNumber(PhoneNumber input) {
    if (validatePhoneNumber(input.number)) {
      phoneNumber.value = '${input.countryCode}${input.number.trim()}';
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  bool isValidPhoneNumber(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validAccountNumberRegex = RegExp(r'^\+\d+$');  // Regex for only digits with no length range

    if (value.isEmpty) {
      isPhoneNumberFieldEmpty.value = true;
      return false;
    } else if (!validAccountNumberRegex.hasMatch(value.trim())) {
      isPhoneNumberFieldEmpty.value = false;
      return false;
    }
    isPhoneNumberFieldEmpty.value = false;
    return true;
  }

  // Function to parse the phone number and update IntlPhoneField
  void setPhoneNumber(String phoneNumber) {
    if(phoneNumber.isNotEmpty) {
      final parsedNumber = PhoneNumber.fromCompleteNumber(completeNumber: phoneNumber);
      initialCountryCode.value = parsedNumber.countryISOCode;
      phoneNumberController.value.text = parsedNumber.number; // national significant number
    }
    else {
      initialCountryCode.value = 'BD';
      phoneNumberController.value.text = '';
    }
  }

  Future<void> pickImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
          source: source,
          preferredCameraDevice: CameraDevice.front,
        );
      if (pickedFile != null) {
        profilePicturePath.value = pickedFile.path;
        selectedImage.value = File(pickedFile.path);
        if (!isAnyFieldChanged.value) {
          isAnyFieldChanged.value = true;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  bool validateAddress(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace

    if (value.isEmpty) {
      return false;
    }
    return true;
  }
  void updateAddress(String input) {
    if (validateAddress(input)) {
      final controller = addressController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  final PersonalApi _personalApi = PersonalApi();
  Future<void> loadPersonalDetails() async {
    try {
      landingPageController.isLoading(true);

      String? userId = prefs.getString('user_id') ?? '';
      PersonalDetailsModel? data = await _personalApi.getPersonalData(userId, token.value);

      if (data != null) {
        personalDetails.value = data;

        id.value = personalDetails.value.id ?? '';
        profilePicturePathFromApi.value = personalDetails.value.photo ?? '';
        selectedGender.value = personalDetails.value.gender ?? '';
        fullNameController.value.text = personalDetails.value.fullName ?? '';
        emailController.value.text = personalDetails.value.email ?? '';
        nidNumberController.value.text = personalDetails.value.nid ?? '';
        nidPicturePathFromApi.value = personalDetails.value.nidImage ?? '';
        phoneNumber.value = personalDetails.value.phone ?? '';
        setPhoneNumber(personalDetails.value.phone ?? '');
        dateOfBirth.value = formatDateTime(personalDetails.value.dob ?? '');
        addressController.value.text = personalDetails.value.address ?? '';
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      landingPageController.isLoading(false);
    }
  }

  Future<void> updatePersonalDetails(PersonalDetailsModel updatedDetails) async {
    try {
      landingPageController.isLoading(true);

      // Find changed fields
      Map<String, dynamic> changedFields = findChangedFields(personalDetails.value, updatedDetails);

      if (changedFields.isNotEmpty) {
        PersonalDetailsModel? data = await _personalApi.updatePersonalDetails(changedFields, token.value);
        if (data != null) {
          personalDetails.value = data;

          id.value = personalDetails.value.id ?? '';
          selectedGender.value = personalDetails.value.gender ?? '';
          fullNameController.value.text = personalDetails.value.fullName ?? '';
          emailController.value.text = personalDetails.value.email ?? '';
          nidNumberController.value.text = personalDetails.value.nid ?? '';
          phoneNumber.value = personalDetails.value.phone ?? '';
          setPhoneNumber(personalDetails.value.phone ?? '');
          dateOfBirth.value = formatDateTime(personalDetails.value.dob ?? '');
          addressController.value.text = personalDetails.value.address ?? '';

          landingPageController.userName.value = personalDetails.value.fullName ?? '';

          Get.snackbar('Success', 'Personal details updated successfully');
        } else {
          Get.snackbar('Error', 'Failed to update Personal details');
        }
      } else {
        Get.snackbar('Info', 'No changes to update');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      landingPageController.isLoading(false);
    }
  }

  Future<void> uploadPhoto() async {
    try {
      landingPageController.isLoading(true);

      dio.Response response = await _personalApi.updatePhoto(selectedImage.value!, token.value);

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        
        profilePicturePathFromApi.value = data['photo'];
        landingPageController.photo.value = data['photo'];
        // Get.snackbar("Success", "Photo uploaded successfully!");
      } else {
        Get.snackbar("Error", "Failed to upload photo. Status: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Upload failed: $e");
    } finally {
      landingPageController.isLoading(false);
    }
  }

  Future<void> uploadNidPhoto() async {
    try {
      landingPageController.isLoading(true);

      dio.Response response = await _personalApi.updateNidPhoto(selectedNidFile.value!, token.value);

      if (response.statusCode == 200) {
        // final data = response.data as Map<String, dynamic>;

        // Get.snackbar("Success", "Photo uploaded successfully!");
      } else {
        Get.snackbar("Error", "Failed to upload photo. Status: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Upload failed: $e");
    } finally {
      landingPageController.isLoading(false);
    }
  }

  Map<String, dynamic> findChangedFields(PersonalDetailsModel oldDetails, PersonalDetailsModel newDetails) {
    Map<String, dynamic> changedFields = {};

    if (oldDetails.fullName != newDetails.fullName) {
      changedFields['fullname'] = newDetails.fullName;
    }
    if (oldDetails.email != newDetails.email) {
      changedFields['email'] = newDetails.email;
    }
    if (oldDetails.nid != newDetails.nid) {
      changedFields['nid'] = newDetails.nid;
    }
    if (oldDetails.gender != newDetails.gender) {
      changedFields['gender'] = newDetails.gender;
    }
    if (oldDetails.dob != newDetails.dob) {
      changedFields['dob'] = newDetails.dob;
    }
    if (oldDetails.phone != newDetails.phone) {
      changedFields['phone'] = newDetails.phone;
    }
    if (oldDetails.address != newDetails.address) {
      changedFields['address'] = newDetails.address;
    }

    return changedFields;
  }

  final List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
  Future<void> pickNidImageFromCamera({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        String fileExtension = pickedFile.path.split('.').last.toLowerCase();

        // Get the file size
        int fileSizeInBytes = await file.length();
        double fileSizeInMB = fileSizeInBytes / (1024 * 1024); // Convert to MB

        // Validate file extension
        if (!allowedExtensions.contains(fileExtension)) {
          Get.snackbar('Invalid File', 'Please upload a valid file (JPG, PNG, JPEG, PDF).');
          return;
        }

        // Validate file size
        if (fileSizeInMB > 5) {
          Get.snackbar('File too large', 'Please upload a file smaller than 5MB.');
          return;
        }

        // If validations pass, set the file
        nidFilePath.value = pickedFile.path;
        selectedNidFile.value = file;
        nidFileName.value = pickedFile.name;
        nidFileSize.value = fileSizeInMB;

        if (!isAnyFieldChanged.value) {
          isAnyFieldChanged.value = true;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<void> pickNidFileFromDevice() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
      );

      if (result != null) {
        // Convert the picked file to a File object
        final File file = File(result.files.single.path!);

        // Get the file size
        int fileSizeInBytes = await file.length();
        double fileSizeInMB = fileSizeInBytes / (1024 * 1024); // Convert to MB

        // Check if the file size is within the limit (5MB)
        if (fileSizeInMB <= 5) {
          // Update file-related observables
          nidFilePath.value = result.files.single.path!;
          selectedNidFile.value = file;
          nidFileName.value = result.files.single.name;
          nidFileSize.value = fileSizeInMB;

          if (!isAnyFieldChanged.value) {
            isAnyFieldChanged.value = true;
          }
        } else {
          Get.snackbar('File too large', 'Please select a file smaller than 5MB.');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
  bool isNidSelected() {
    if (selectedNidFile.value != null || nidPicturePathFromApi.value.isNotEmpty) {
      isNidFileSelected.value = true;
      return true;
    }
    isNidFileSelected.value = false;
    return false;
  }

  DateTime? formatDateTime(String createdAt) {
    if(createdAt.isNotEmpty) {
      DateTime dateTime = DateTime.parse(createdAt);
      return dateTime;
    }
    return null;
  }

  @override
  void onInit() async {
    super.onInit();
    await initializeToken();
  }

  @override
  void onClose() {
    fullNameController.value.dispose();
    emailController.value.dispose();
    nidNumberController.value.dispose();
    phoneNumberController.value.dispose();
    addressController.value.dispose();
    super.onClose();
  }
}