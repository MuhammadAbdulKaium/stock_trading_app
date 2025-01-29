import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/upload_payment_proof_api.dart';
import 'package:stock_trading_app/common/common_error_dialog.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/mobile/payment_proof/payment_confirmation_dialog.dart';

class PaymentProofController extends GetxController {
  var isLoading = false.obs;
  var investedProductId = ''.obs;
  var selectedFile = Rx<File?>(null);
  var fileName = ''.obs;
  var fileSize = 0.0.obs;
  var fileExtension = ''.obs;
  var filePath = ''.obs;
  var isPickerActive = false.obs;  // Flag to check if picker is active
  final RxBool isPaymentProofSelected = false.obs;

  Future<void> uploadPaymentProof1() async {
    isLoading(true);
    try {
      // currentBuyingPrice.value = confirmingOrderDetails.value.pricePerUnit!.toDouble();

      Get.toNamed("/payment_proof_page");
    } catch (e) {
      // throw Exception('Error: $e');
      Get.dialog(
        CustomAlartDialog(
          begin: 0,
          end: 0,
          alignment: Alignment.bottomCenter,
          duration: 300,
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          horizontalPadding: 0,
          backgroundColor: Colors.red,
          dialogHeader: const SizedBox(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Something went wrong please try again.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.white,
                    fontFamily: 'FontCircularStd',
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
          dialogContent: Container(),
        )
      );
    } finally {
      isLoading(false);
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

  var token = ''.obs;
  late SharedPreferences prefs;
  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  final UploadPaymentProofApi _uploadPaymentProofApi = UploadPaymentProofApi();
  void uploadPaymentProof() async {
    if (selectedFile.value != null) {
      isLoading.value = true;
      try {
        final response = await _uploadPaymentProofApi.uploadPaymentProof(investedProductId.value, selectedFile.value!, token.value);

        if (response.statusCode == 201) {
          Get.dialog(const PaymentConfirmationDialog());
        } else {
          Get.dialog(const CommonErrorDialog(title: 'Error', message: 'File upload failed'));
        }
      } catch (e) {
        Get.snackbar(
          'Error', 
          'An error occurred: $e',
          duration: const Duration(seconds: 5),
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar('Error', 'No file selected');
    }
  }

  void resetVariables() {
    // selectedFile.value = null;
  }

  @override
  void onInit() async {
    super.onInit();
    // Retrieve the passed ID from arguments
    if (Get.arguments != null) {
      investedProductId.value = Get.arguments['id'];
    }

    ever(selectedFile, (_) {
      isPaymentProofSelected.value = selectedFile.value != null;
    });

    await initializeToken();
  }
}