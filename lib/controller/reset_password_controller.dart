import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';

final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();

class ResetPasswordController extends GetxController {
  final List<TextEditingController> codeControllers = List.generate(5, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  final TextEditingController newPasswordController = TextEditingController();
  final RxBool isCodeValid = false.obs;
  final RxBool isPasswordValid = false.obs;
  final RxBool isValidationAttempted = false.obs;
  final newPassword = ''.obs;
  final isPasswordVisible = false.obs;
  var isLoading = false.obs;

  // Mock confirmation code for demo purposes
  final String confirmationCode = "12345";
  String confirmationCodeByUser = "";

  void validateCode() {
    confirmationCodeByUser = codeControllers.map((c) => c.text).join();
    isCodeValid.value = confirmationCodeByUser == confirmationCode;
  }

  void handlePaste(String value) {
    if (value.length == 5) {
      for (int i = 0; i < 5; i++) {
        codeControllers[i].text = value[i];
      }
      validateCode();
      focusNodes[4].requestFocus();
    }
  }

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

  void validationAttempt() {
    isValidationAttempted.value = true;
  }

  // Function to handle Reset Password
  Future<void> resetPassword(String code, String newPassword) async {
    isLoading(true);
    try {
      // Add your API call logic here
      // On successful login, if rememberMe is true, save credentials
      // if (checkedRememberMe.value) {
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   await prefs.setString('email', email);
      //   await prefs.setString('password', password);
      // } else {
      //   // Clear saved credentials if rememberMe is false
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   await prefs.remove('email');
      //   await prefs.remove('password');
      // }
      // Navigate to the home screen or next page
      // Get.toNamed('/landing_mobile');
      _signinSignupNavigationController.navigateTo(0);
    } catch (e) {
      // Handle errors (show snackbar, etc.)
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
                  'Incorrect CODE or PASSWORD',
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
