import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/admin_bank_info_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/admin_bank_info_model.dart';

class BookingPageController extends GetxController {
  var isLoading = false.obs;
  var adminBankInfo = AdminBankInfoModel().obs;
  final checkedAgreementWithTermsAndCondition = false.obs;
  final RxBool isAccountNameCopied = false.obs;
  final RxBool isAccountNumberCopied = false.obs;
  final RxBool isRoutingNumberCopied = false.obs;
  var token = ''.obs;

  Future<void> initializeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

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

  final AdminBankInfoApi _adminBankInfoApi = AdminBankInfoApi();
  Future<void> loadBookingPage() async {
    try {
      isLoading(true);

      AdminBankInfoModel? data = await _adminBankInfoApi.getAdminBankInfo(token.value);

      if (data != null) {
        adminBankInfo.value = data;
      }

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

  @override
  void onInit() async {
    super.onInit();
    await initializeToken();
  }
}