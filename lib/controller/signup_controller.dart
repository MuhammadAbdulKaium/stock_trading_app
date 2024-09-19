import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/api/create_account_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/models/user_signup_info_model.dart';

class SignupController extends GetxController {
  final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
  final fullName = ''.obs;
  late TextEditingController fullNameController = TextEditingController();
  final email = ''.obs;
  final isValidFullName = false.obs;
  final isValidEmail = false.obs;
  final password = ''.obs;
  final isPasswordVisible = false.obs;
  final retypePassword = ''.obs;
  final isRetypePasswordVisible = false.obs;
  // var isLoading = false.obs;
  final RxBool isAnyFieldChanged = false.obs;

  bool validateName(String value) {
    final validNameRegex = RegExp(r"^[a-zA-Zà-žÀ-Ž\s\.\,\-'\’]+$");   // Define a regular expression for valid name characters (e.g., letters, spaces, and common punctuation)

    if (value.isEmpty) {
      return false;
    } else if (!validNameRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  void signUpValidateName(String input) {
    if (validateName(input)) {
      fullNameController.text = fullName.value = input;
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  void validateEmail(String input) {
    isValidEmail.value = GetUtils.isEmail(input.trim());

    isValidEmail.value ? email.value = input.trim() : email.value = '';
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
  void updatePassword(String input) {
    if (validatePassword(input)) {
      password.value = input;
    }
  }

  void passwordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void updateRetypePassword(String input) {
    if (validatePassword(input)) {
      retypePassword.value = input;
    }
  }

  void retypePasswordVisibility() {
    isRetypePasswordVisible.value = !isRetypePasswordVisible.value;
  }

  final CreateAccountAPI _createAccountAPI = CreateAccountAPI();
  Rx<UserSignupInfoModel?> userSignupInfo = Rx<UserSignupInfoModel?>(null);
  Future<void> signUp(String fullName, String email, String password) async {
    try {
      signinSignupNavigationController.isLoading(true);
      final responseData = await _createAccountAPI.createAccount(fullName: fullName, email: email, password: password);

      userSignupInfo.value = UserSignupInfoModel.fromJson(responseData);

      if(!userSignupInfo.value!.isVerified) {
        signinSignupNavigationController.navigateTo(4); // Navigate to Signup Verification
      }
    } catch (e) {
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
                  'EMAIL is Incorrect or already Registered',
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
      signinSignupNavigationController.isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fullNameController.text = fullName.value;
  }

  @override
  void onClose() {
    fullNameController.dispose();
    super.onClose();
  }
}