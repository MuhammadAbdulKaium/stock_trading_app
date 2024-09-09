import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/bank_details_model.dart';

class BookingPageController extends GetxController {
  var isLoading = false.obs;
  var bankDetails = BankDetailsModel().obs;
  final checkedAgreementWithTermsAndCondition = false.obs;
  final RxBool isAccountNameCopied = false.obs;
  final RxBool isAccountNumberCopied = false.obs;
  final RxBool isRoutingNumberCopied = false.obs;

  void toggleAccountNameCopyIcon(bool isFilled) {
    isAccountNameCopied.value = isFilled;
  }
  void toggleAccountNumberCopyIcon(bool isFilled) {
    isAccountNumberCopied.value = isFilled;
  }
  void toggleRoutingNumberCopyIcon(bool isFilled) {
    isRoutingNumberCopied.value = isFilled;
  }

  void copyToClipboard(String text, String title) {
    Clipboard.setData(ClipboardData(text: text));

    // Close any currently visible snackbars
    if (Get.isSnackbarOpen) {
      Get.back();  // Close the current snackbar
    }

    Get.rawSnackbar(
      messageText: Text(
        '$title copied to clipboard',
        style: TextStyle(
          color: const Color(0xFFE5E8EC),
          fontSize: 13.5.sp,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
        ),
        ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      borderRadius: 8,
      icon: const Icon(Icons.check, color: Colors.white),
      duration: const Duration(milliseconds: 1500),
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  Future<void> loadBookingPage() async {
    isLoading(true);
    try {
      bankDetails.value = BankDetailsModel(
        id: '1',
        bankName: 'Dutch Bangla Bank',
        branchName: 'Rangpur Branch',
        accountHolderName: 'Stock House LTD',
        accountNumber: '03597561512145152152',
        routingNumber: '23546878984',
      );

      // remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
      // currentBuyingPrice.value = investmentOpportunityDetails.value.pricePerUnit!.toDouble();

      Get.toNamed("/booking_page");
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
}