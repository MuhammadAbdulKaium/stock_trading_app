import 'package:get/get.dart';

class SignupController extends GetxController {
  final fullName = ''.obs;
  final email = ''.obs;
  final isValidFullName = false.obs;
  final isValidEmail = false.obs;
  final password = ''.obs;
  final isPasswordVisible = false.obs;
  final retypePassword = ''.obs;
  final isRetypePasswordVisible = false.obs;
  var isLoading = false.obs;

  void signUpValidateName(String input) {
    if(fullName.isNotEmpty) {
      fullName.value = input.trim();
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
}