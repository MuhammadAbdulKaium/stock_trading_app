import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/api/forgot_password_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:dio/dio.dart' as dio;

class ForgetPasswordController extends GetxController {
  final email = ''.obs;
  final isValidEmail = false.obs;
  var isLoading = false.obs;

  void validateEmail(String input) {
    isValidEmail.value = GetUtils.isEmail(input.trim());

    isValidEmail.value ? email.value = input.trim() : email.value = '';
  }

  final ForgotPasswordApi _forgotPasswordApi = ForgotPasswordApi();
  final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
  Future<void> sendCodeToEmailToResetPassword(String email) async {
    try {
      isLoading(true);

      dio.Response response = await _forgotPasswordApi.sendCodeToEmailToResetPassword(email);

      if(response.statusCode == 201) {
        _signinSignupNavigationController.navigateTo(2);
      }
      else {
        handleLoginError('Incorrect EMAIL', '');
      }
    } catch (e) {
      // Handle errors (show snackbar, etc.)
      handleLoginError('Incorrect EMAIL', '');
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
