import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/forget_password.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/login_form.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/reset_password.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/signup_form.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/signup_verification.dart';

class SigninSignupNavigationController extends GetxController {
  var isLoading = false.obs;
  final currentIndex = 0.obs;
  final List<int> _navigationStack = [0];
  final canGoBack = true.obs;

  void navigateTo(int index) {
    // print('Navigate To: ${index}');
    currentIndex.value = index;
    if (_navigationStack.isNotEmpty) {
      canGoBack.value = false;
    }
    _navigationStack.add(index);
  }

  // Future<void> onWillPop() async {
  //   if (currentIndex.value == 0) {
  //     return;
  //   } else if (currentIndex.value == 2) {
  //     navigateTo(1); // Navigate from ResetPassword to ForgetPassword
  //   } else {
  //     navigateTo(0); // Navigate back to LoginForm
  //   }
  // }

  Future<void> onWillPop() async {
    if (_navigationStack.isNotEmpty) {
      canGoBack.value = false;
    }
    if (_navigationStack.length > 1) {
      _navigationStack.removeLast();
      currentIndex.value = _navigationStack.last;
      // canGoBack.value = false;

      // if (_navigationStack.length == 1 && _navigationStack.last == 0) {
      //   canGoBack.value = true;
      // }
    } else {
      // Allow the app to close if there's no page to go back to
      // canGoBack.value = true;
      // Get.back();
      // return;
    }

    if (_navigationStack.length == 1 && _navigationStack.last == 0) {
      canGoBack.value = true;
    }
  }

  Widget getCurrentPage() {
    switch (currentIndex.value) {
      case 1:
        canGoBack.value = false;
        return const ForgetPassword();
      case 2:
        canGoBack.value = false;
        return const ResetPassword();
      case 3:
        canGoBack.value = false;
        return const SignupForm();
      case 4:
        canGoBack.value = false;
        return const SignupVerification();
      default:
        return const LoginForm();
    }
  }
}
