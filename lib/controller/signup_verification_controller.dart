import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';

class SignupVerificationController extends GetxController {
  final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
  final List<TextEditingController> codeControllers = List.generate(5, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  final RxBool isCodeValid = false.obs;
  final RxBool isValidationAttempted = false.obs;
  var isLoading = false.obs;

  // Mock confirmation code for demo purposes
  final String confirmationCode = "12345";
  String verificationCodeByUser = "";

  void validateCode() {
    verificationCodeByUser = codeControllers.map((c) => c.text).join();
    isCodeValid.value = verificationCodeByUser == confirmationCode;
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

  void validationAttempt() {
    isValidationAttempted.value = true;
  }

  Future<void> verifyEmail(String code) async {
    isLoading(true);
    try {
      signinSignupNavigationController.navigateTo(0);

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
                  'Invalid Verification Code',
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