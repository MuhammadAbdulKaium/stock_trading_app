import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final isValidEmail = false.obs;
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;
  final checkedRememberMe = false.obs;
  var isLoading = false.obs;

  void validateEmail(String input) {
    isValidEmail.value = GetUtils.isEmail(input.trim());

    isValidEmail.value ? email.value = input.trim() : email.value = '';
  }

  void passwordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // bool validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return false;
  //   } else if (value.length < 8) {
  //     return false;
  //   } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
  //     return false;
  //   } else if (!RegExp(r'[0-9]').hasMatch(value)) {
  //     return false;
  //   } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
  //     return false;
  //   }

  //   return true;
  // }

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
      password.value = input;
    }
  }

  // Function to handle login
  Future<void> login(String email, String password) async {
    isLoading(true);
    try {
      // Add your API call logic here
      // On successful login, if rememberMe is true, save credentials
      if (checkedRememberMe.value) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setString('password', password);
      } else {
        // Clear saved credentials if rememberMe is false
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('email');
        await prefs.remove('password');
      }
      // Navigate to the home screen or next page
      Get.offAllNamed('/landing_mobile');
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
                  'Incorrect EMAIL or PASSWORD',
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

  // Function to load saved credentials
  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString('email') ?? '';
    password.value = prefs.getString('password') ?? '';
    checkedRememberMe.value = email.isNotEmpty && password.isNotEmpty;
  }
}