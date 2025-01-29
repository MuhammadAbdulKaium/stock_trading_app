import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/api/forgot_password_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:dio/dio.dart' as dio;

class ResetPasswordController extends GetxController {
  final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
  final newPassword = ''.obs;
  final isPasswordVisible = false.obs;
  var isLoading = false.obs;
  final confirmationCode = ''.obs;

  bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length < 7) {
      return false;
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return false;
    }

    return true;
  }

  void updatePasswordVariable(String input) {
    if (validatePassword(input)) {
      newPassword.value = input;
    }
  }

  void passwordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Function to handle Reset Password
  final ForgotPasswordApi _forgotPasswordApi = ForgotPasswordApi();
  Future<void> resetPassword(String code, String newPassword) async {
    try {
      isLoading(true);

      dio.Response response = await _forgotPasswordApi.resetPassword(code, newPassword);
      if(response.statusCode == 200) {
        Get.snackbar('Success', 'Password reset successfully.');
        _signinSignupNavigationController.navigateTo(0);
      }
      else {
        handleLoginError('Incorrect Verification Code or Password', '');
      }
    } catch (e) {
      // Handle errors (show snackbar, etc.)
      handleLoginError('Incorrect Verification Code or Password', '');
    } finally {
      isLoading(false);
    }
  }

  void handleLoginError(String errorTitle, String errorMessage) {
    Get.dialog(
      CustomAlartDialog(
        begin: 0,
        end: 0,
        alignment: Alignment.bottomCenter,
        duration: 300,
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        horizontalPadding: 0,
        backgroundColor: Colors.red,
        dialogHeader: SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                errorTitle,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.white,
                  fontFamily: 'FontCircularStd',
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        dialogContent: errorMessage.isNotEmpty ? Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ) 
        : Container(),
      ),
    );
  }
}
