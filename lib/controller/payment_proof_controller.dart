import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/mobile/payment_proof/payment_confirmation_dialog.dart';

class PaymentProofController extends GetxController {
  var isLoading = false.obs;
  var selectedFile = Rx<File?>(null);
  var fileName = ''.obs;
  var fileSize = 0.0.obs;
  var fileExtension = ''.obs;
  var filePath = ''.obs;
  var isPickerActive = false.obs;  // Flag to check if picker is active

  Future<void> loadPaymentProofPage() async {
    isLoading(true);
    try {
      // confirmingOrderDetails.value = OrderDetailsModel(
      //   id: '1',
      //   name: 'Aman Rice',
      //   category: 'rice',
      //   status: 'active',
      //   warehouse: 'Kaunia, Rangpur',
      //   type: 'Premium',
      //   regionOfOrigin: 'Rajshahi',
      //   lotSize: 10,
      //   pricePerUnit: 1000,
      //   storageConditions: 'Cool, dry place',
      //   optimalStorageTemperature: '15-20',
      //   monthlyStoreCost: 100,
      //   transportCost: 100,
      //   handlingFees: 20,
      //   quantityAvailable: 19,
      // );

      // remainingLot.value = maximumLot.value = confirmingOrderDetails.value.lotSize!.toInt();
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
          // Get.snackbar('Success', 'File uploaded successfully');
          Get.dialog(const PaymentConfirmationDialog());
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
}