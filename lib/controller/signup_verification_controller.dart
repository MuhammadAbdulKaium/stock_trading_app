import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/api/user_verification_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/service/shared_preferences_service.dart';

class SignupVerificationController extends GetxController {
  final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
  final SharedPreferencesService _sharedPreferences = Get.find<SharedPreferencesService>();
  final verificationCode = ''.obs;
  final email = ''.obs;
  // var isLoading = false.obs;
  final UserVerificationApi _userVerificationApi = UserVerificationApi();
  

  Future<void> verifyEmail(String code) async {
    try {
      signinSignupNavigationController.isLoading(true);

      final response = await _userVerificationApi.userVerification(code);

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Email verified successfully!");
        signinSignupNavigationController.navigateTo(0);
      } else {
        handleVerificationError('Invalid Verification Code', '');
      }
    } catch (e) {
      handleVerificationError('Invalid Email or Verification Code', '');
    } finally {
      signinSignupNavigationController.isLoading(false);
    }
  }

  Future<void> sendVerificationMail(String email) async {
    try {
      signinSignupNavigationController.isLoading(true);
      
      final verificationMailResponse = await _userVerificationApi.sendVerificationMail(email);

      if (verificationMailResponse.statusCode == 201) {
        Get.snackbar('Verification', 'Verification code sent to $email.');
      }
    } catch (e) {
      // Handle errors (show snackbar, etc.)
      handleVerificationError('Incorrect EMAIL or PASSWORD', '');
    } finally {
      signinSignupNavigationController.isLoading(false);
    }
  }

  void handleVerificationError(String errorTitle, String errorMessage) {
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

  Future<void> _loadUserInfo() async {
    email.value = _sharedPreferences.getString('email');
  }

  @override
  void onInit() {
    super.onInit();
    _loadUserInfo();
  }
}