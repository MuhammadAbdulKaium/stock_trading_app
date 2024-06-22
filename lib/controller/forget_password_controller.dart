import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';

class ForgetPasswordController extends GetxController {
  final email = ''.obs;
  final isValidEmail = false.obs;
  var isLoading = false.obs;

  void validateEmail(String input) {
    isValidEmail.value = GetUtils.isEmail(input.trim());

    isValidEmail.value ? email.value = input.trim() : email.value = '';
  }

  final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
  Future<void> forgetPasswordSendCodeToEmail(String email) async {
    isLoading(true);
    try {
      // // Add your API call logic here
      // // On successful login, if rememberMe is true, save credentials
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
      // // Navigate to the home screen or next page


      _signinSignupNavigationController.navigateTo(2);
      // Get.toNamed('/landing_mobile');
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
                  'Incorrect EMAIL',
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
