import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/contact_us_api.dart';
import 'package:stock_trading_app/api/personal_api.dart';
import 'package:stock_trading_app/mobile/contact_us/message_sent_failed_dialog.dart';
import 'package:stock_trading_app/mobile/contact_us/message_sent_success_dialog.dart';
import 'package:stock_trading_app/models/personal_details_model.dart';

class ContactUsController extends GetxController {
  var isLoading = false.obs;
  final selectedRequestType = ''.obs;
  List<String> availableRequestTypeList = ['Request Type', 'Others'].obs;
  final isDropdownOpened = false.obs;
  var inputText = ''.obs;
  var isBold = false.obs;
  var isItalic = false.obs;
  var insertedImage = Rx<XFile?>(null);
  final RxBool isAnyFieldChanged = false.obs;

  void toggleBold() => isBold.value = !isBold.value;
  void toggleItalic() => isItalic.value = !isItalic.value;
  Future<void> insertImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      insertedImage.value = image;
    }
  }

  void changeSelectedRequestType(String value) {
    selectedRequestType.value = value;
  }

  var filePath = ''.obs;
  var selectedFile = Rx<File?>(null);
  var fileName = ''.obs;
  var fileSize = 0.0.obs;
  final ImagePicker _picker = ImagePicker();

  final List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
  Future<void> pickImageFromCamera({required ImageSource source}) async {
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
        filePath.value = pickedFile.path;
        selectedFile.value = file;
        fileName.value = pickedFile.name;
        fileSize.value = fileSizeInMB;
        
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
  Future<void> pickFileFromDevice() async {
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
          filePath.value = result.files.single.path!;
          selectedFile.value = file;
          fileName.value = result.files.single.name;
          fileSize.value = fileSizeInMB;

        } else {
          Get.snackbar('File too large', 'Please select a file smaller than 5MB.');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  final isExpanded = true.obs;
  late Timer _timer;

  // Method to toggle the expanded state periodically
  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 1350), (timer) {
      isExpanded.value = !isExpanded.value;
    });
  }

  var token = ''.obs;
  late SharedPreferences prefs;
  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }
  final ContactUsApi _contactUsApi = ContactUsApi();
  final PersonalApi _personalApi = PersonalApi();

  Future<void> sendMessage() async {
    try {
      isLoading(true);

      String? userId = prefs.getString('user_id') ?? '';
      PersonalDetailsModel? data = await _personalApi.getPersonalData(userId, token.value);
      
      final response = await _contactUsApi.contactUs(data?.fullName ?? '', data?.email ?? '', data?.phone ?? '', inputText.value, token.value);
      
      if (response.statusCode == 201) {
        Get.dialog(const MessageSentSuccessDialog());
      } else if (response.statusCode == 400) {
        List<dynamic> errorMessages = response.data['message'];

        if (errorMessages.contains("name should not be empty") || 
            errorMessages.contains("email should not be empty") || 
            errorMessages.contains("phone should not be empty")) {
          // Get.snackbar('Validation Error', 'Please fill in all the required fields.');
          Get.dialog(const MessageSentFailedDialog());
        } else {
          Get.snackbar('Error', 'Something went wrong, please try again later.');
        }
      } else {
        Get.snackbar('Error', 'Something went wrong, please try again later.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  // void resetVariables() {
  //   isAnyFieldChanged.value = false;
  //   selectedFile = Rx<File?>(null);
  // }

  @override
  void onInit() async {
    super.onInit();
    selectedRequestType.value = availableRequestTypeList.first;
    _startAnimation();

    // Set up reactive listeners to monitor changes in inputText or insertedImage
    ever(inputText, (_) {
      isAnyFieldChanged.value = inputText.isNotEmpty || insertedImage.value != null || selectedFile.value != null;
    });
    // ever(insertedImage, (_) {
    //   isAnyFieldChanged.value = inputText.isNotEmpty || insertedImage.value != null || selectedFile.value != null;
    // });
    // ever(selectedFile, (_) {
    //   isAnyFieldChanged.value = inputText.isNotEmpty || insertedImage.value != null || selectedFile.value != null;
    // });

    await initializeToken();
  }

  @override
  void onClose() {
    _timer.cancel();
    // resetVariables();
    super.onClose();
  }
}