import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:stock_trading_app/models/personal_details_model.dart';

class PersonalController extends GetxController {
  var selectedImage = Rxn<File>();
  final RxString profilePicturePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  var personalDetails = PersonalDetailsModel().obs;
  final RxBool isAnyFieldChanged = false.obs;
  Rx<String?> selectedGender = Rx<String?>(null);
  var isGenderInvalid = false.obs;
  var genderError = ''.obs;

  final fullName = ''.obs;
  final email = ''.obs;
  final nidNumber = ''.obs;
  final dateOfBirth = Rxn<DateTime>();
  final phoneNumber = ''.obs;
  final address = ''.obs;

  // final fullNameController = TextEditingController();
  // final emailController = TextEditingController();
  // final nidNumberController = TextEditingController();
  // final dateOfBirthController = TextEditingController();
  final phoneNumberController = TextEditingController();

  var isLoading = false.obs;
  var selectedFile = Rx<File?>(null);
  var fileName = ''.obs;
  var fileSize = 0.0.obs;
  var fileExtension = ''.obs;
  var filePath = ''.obs;
  var isPickerActive = false.obs;  // Flag to check if picker is active

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
      fullName.value = input.trim();
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  void validateEmail(String input) {
    final isValidEmail = GetUtils.isEmail(input.trim());

    isValidEmail ? email.value = input.trim() : email.value = '';
  }

  bool validateAccountNumber(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validAccountNumberRegex = RegExp(r'^\d{10,17}$');   // Define a regular expression for numbers with up to 17 digits

    if (value.isEmpty) {
      return false;
    } else if (!validAccountNumberRegex.hasMatch(value.trim())) {
      return false;
    }
    return true;
  }
  void updateAccountNumber(String input) {
    if (validateAccountNumber(input)) {
      nidNumber.value = input.trim();
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
    if (selectedGender.value == null) {
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
      return false;
    } else if (!validAccountNumberRegex.hasMatch(value.trim())) {
      return false;
    }
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

  Future<void> pickImage({required ImageSource source}) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      profilePicturePath.value = pickedFile.path;
      selectedImage.value = File(pickedFile.path);
      if (!isAnyFieldChanged.value) {
        isAnyFieldChanged.value = true;
      }
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
    if (validateAccountNumber(input)) {
      address.value = input.trim();
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  Future<void> loadPersonalDetails() async {
    try {
      personalDetails.value = PersonalDetailsModel(
        id: '1',
        fullName: 'Abdul Kaium',
        email: 'makaium33@gmail.com',
        nidNumber: '123421231233423',
        phoneNumber: '1648915605',
        address: '',
      );

      fullName.value = personalDetails.value.fullName ?? '';
      // fullNameController.text = personalDetails.value.fullName ?? '';
      email.value = personalDetails.value.email ?? '';
      // emailController.text = personalDetails.value.email ?? '';
      nidNumber.value = personalDetails.value.nidNumber ?? '';
      // nidNumberController.text = personalDetails.value.nidNumber ?? '';
      phoneNumber.value = personalDetails.value.phoneNumber ?? '';
      phoneNumberController.text = personalDetails.value.phoneNumber ?? '';
      // dateOfBirth.value = (personalDetails.value.dateOfBirth ?? '') as DateTime?;
      address.value = personalDetails.value.address ?? '';
    } catch (e) {
      // throw Exception('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  void pickFile() async {
    if (isPickerActive.value) return;  // Prevent reopening if picker is active

    isPickerActive.value = true;  // Set the picker as active

    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf', 'jpeg'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);

        if (file.lengthSync() <= 5 * 1024 * 1024) {
          selectedFile.value = file;
          fileName.value = result.files.single.name;
          fileSize.value = file.lengthSync() / (1024 * 1024);
          fileExtension.value = fileName.split('.').last;
          filePath.value = file.path;

          // print('Name: ${fileName.value}');
          // print('Name: ${fileSize.value / (1024 * 1024)}');
          // print('Name: ${fileExtension.value}');
          // print('Name: ${filePath.value}');
        } else {
          Get.snackbar('Error', 'File size exceeds 5MB');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isPickerActive.value = false;  // Reset the picker as inactive
    }
  }

  void uploadFile() async {
    if (selectedFile.value != null) {
      isLoading.value = true;
      try {
        // Replace with your file upload logic
        dio.Dio dioInstance = dio.Dio();
        dio.FormData formData = dio.FormData.fromMap({
          'file': await dio.MultipartFile.fromFile(selectedFile.value!.path),
        });

        // Example API call
        var response = await dioInstance.post('https://your-api-endpoint.com/upload', data: formData);
        
        if (response.statusCode == 200) {
          Get.snackbar('Success', 'File uploaded successfully');
          // Get.dialog(const PaymentConfirmationDialog());
        } else {
          Get.snackbar('Error', 'File upload failed');
        }
      } catch (e) {
        Get.snackbar('Error', 'An error occurred: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar('Error', 'No file selected');
    }
  }

  void resetVariables() {
    selectedFile.value = null;
  }

  @override
  void onClose() {
    // fullNameController.dispose();
    // emailController.dispose();
    // nidNumberController.dispose();
    // dateOfBirthController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}