import 'dart:io';
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

  var selectedNidFile = Rx<File?>(null);
  var nidFileName = ''.obs;
  var nidFileSize = 0.0.obs;
  var nidFileExtension = ''.obs;
  var nidFilePath = ''.obs;
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

  static const int maxFileSize = 5 * 1024 * 1024; // 5MB in bytes
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
        if (fileSizeInMB <= 5) {
          Get.snackbar('File too large', 'Please upload a file smaller than 5MB.');
          return;
        }

        // If validations pass, set the file
        nidFilePath.value = pickedFile.path;
        selectedNidFile.value = File(pickedFile.path);
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


  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}