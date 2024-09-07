import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/auth_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/user_login_info_model.dart';
import 'package:stock_trading_app/service/shared_preferences_service.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  TextEditingController passwordController = TextEditingController();
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

  // bool validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return false;
  //   } else if (value.length < 7) {
  //     return false;
  //   }

  //   return true;
  // }

  void updatePasswordVariable(String input) {
    if (validatePassword(input)) {
      passwordController.text = password.value = input;
    }
  }

  // Function to handle login
  final AuthAPI _authAPI = AuthAPI();
  final SharedPreferencesService _sharedPreferences = Get.find<SharedPreferencesService>();
  Rx<UserLoginInfoModel?> userLoginInfo = Rx<UserLoginInfoModel?>(null);
  Future<void> login(String email, String password) async {
    isLoading(true);
    try {
      // Add your API call logic here
      final responseData = await _authAPI.authenticateUser(email, password);
      // final userInfoObject = responseData['data'];
      Map<String, dynamic> decodedToken = JwtDecoder.decode(responseData['access_token']);
      userLoginInfo.value = UserLoginInfoModel(
        userId: decodedToken['user_id'],
        username: decodedToken['name'],
        email: decodedToken['email'],
        roles: decodedToken['roles']?.cast<String?>(),
        photo: decodedToken['photo'],
        iat: decodedToken['iat'],
        exp: decodedToken['exp']
      );

      _sharedPreferences.saveString('token', responseData['access_token']);
      _sharedPreferences.saveString('user_id', userLoginInfo.value!.userId ?? '');
      _sharedPreferences.saveString('username', userLoginInfo.value!.username ?? '');
      _sharedPreferences.saveString('email', userLoginInfo.value!.email ?? '');
      _sharedPreferences.saveString('photo', userLoginInfo.value!.photo ?? '');
      _sharedPreferences.saveInt('iat', userLoginInfo.value!.iat ?? 0);
      _sharedPreferences.saveInt('exp', userLoginInfo.value!.exp ?? 0);
      // Save roles list to SharedPreferences, ensuring non-null and non-nullable values
      if (userLoginInfo.value!.roles != null) {
        final nonNullRoles = userLoginInfo.value!.roles!.whereType<String>().toList();
        _sharedPreferences.saveStringList('roles', nonNullRoles);
      }
      _sharedPreferences.saveString('password', password);

      // On successful login, if rememberMe is true, save credentials
      if (checkedRememberMe.value) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('emailForRememberMe', email);
        await prefs.setString('passwordForRememberMe', password);
      } else {
        // Clear saved credentials if rememberMe is false
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('emailForRememberMe');
        await prefs.remove('passwordForRememberMe');
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
    email.value = prefs.getString('emailForRememberMe') ?? '';
    passwordController.text = password.value = prefs.getString('passwordForRememberMe') ?? '';
    checkedRememberMe.value = email.isNotEmpty && password.isNotEmpty;
  }

  @override
  void onInit() {
    super.onInit();
    passwordController.text = password.value;
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
}