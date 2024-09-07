import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/api/create_account_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/models/user_signup_info_model.dart';
import 'package:stock_trading_app/service/shared_preferences_service.dart';

class SignupController extends GetxController {
  final fullName = ''.obs;
  late TextEditingController fullNameController = TextEditingController();
  final email = ''.obs;
  final isValidFullName = false.obs;
  final isValidEmail = false.obs;
  final password = ''.obs;
  final isPasswordVisible = false.obs;
  final retypePassword = ''.obs;
  final isRetypePasswordVisible = false.obs;
  var isLoading = false.obs;
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

  final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
  final CreateAccountAPI _createAccountAPI = CreateAccountAPI();
  final SharedPreferencesService _sharedPreferences = Get.find<SharedPreferencesService>();
  Rx<UserSignupInfoModel?> userSignupInfo = Rx<UserSignupInfoModel?>(null);
  Future<void> signUp(String fullName, String email, String password) async {
    isLoading(true);
    try {
      final responseData = await _createAccountAPI.createAccount(fullName: fullName, email: email, password: password);

      userSignupInfo.value = UserSignupInfoModel.fromJson(responseData);

      print('================');
      print(userSignupInfo.value?.email);

      // userSignupInfo.value = UserSignupInfoModel(
      //   fullname: responseData['fullname'],
      //   email: responseData['email'],
      //   password: responseData['password'],
      //   nid: responseData['nid'],
      //   nidImage: responseData['nid_image'],
      //   gender: responseData['gender'],
      //   dob: responseData['dob'],
      //   phone: responseData['phone'],
      //   address: responseData['address'],
      //   photo: responseData['photo'],
      //   role: responseData['role'],
      //   createdBy: responseData['created_by'],
      //   updatedBy: responseData['updated_by'],
      //   deletedBy: responseData['deleted_by'],
      //   id: responseData['id'],
      //   registeredAt: responseData['registered_at'],
      //   isActive: responseData['is_active'],
      //   isVerified: responseData['is_verified'],
      //   createdAt: responseData['created_at'],
      //   updatedAt: responseData['updated_at'],
      //   deletedAt: responseData['deleted_at'],
      // );

      // print('================');
      // print(userSignupInfo.value);

      if(!userSignupInfo.value!.isVerified) {
        signinSignupNavigationController.navigateTo(4); // Navigate to Signup Verification
      }

      // _sharedPreferences.saveString('user_id', userInfo.value!.userId ?? '');
      // _sharedPreferences.saveString('username', userInfo.value!.username ?? '');
      // _sharedPreferences.saveString('email', userInfo.value!.email ?? '');
      // _sharedPreferences.saveString('photo', userInfo.value!.photo ?? '');
      // _sharedPreferences.saveInt('iat', userInfo.value!.iat ?? 0);
      // _sharedPreferences.saveInt('exp', userInfo.value!.exp ?? 0);
      // // Save roles list to SharedPreferences, ensuring non-null and non-nullable values
      // if (userInfo.value!.roles != null) {
      //   final nonNullRoles = userInfo.value!.roles!.whereType<String>().toList();
      //   _sharedPreferences.saveStringList('roles', nonNullRoles);
      // }
      // _sharedPreferences.saveString('password', password);

      // // On successful login, if rememberMe is true, save credentials
      // if (checkedRememberMe.value) {
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   await prefs.setString('emailForRememberMe', email);
      //   await prefs.setString('passwordForRememberMe', password);
      // } else {
      //   // Clear saved credentials if rememberMe is false
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   await prefs.remove('emailForRememberMe');
      //   await prefs.remove('passwordForRememberMe');
      // }

      // print('=================$email');
      // print('=================$password');
      // // Navigate to the home screen or next page
      // Get.offAllNamed('/landing_mobile');
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