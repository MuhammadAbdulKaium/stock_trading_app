import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/auth_api.dart';
import 'package:stock_trading_app/api/user_verification_api.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/models/user_login_info_model.dart';
import 'package:stock_trading_app/service/shared_preferences_service.dart';

class LoginController extends GetxController {
  final SigninSignupNavigationController signinSignupNavigationController = Get.put(SigninSignupNavigationController());
  final email = ''.obs;
  TextEditingController passwordController = TextEditingController();
  final isValidEmail = false.obs;
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;
  final checkedRememberMe = false.obs;
  final AuthAPI _authAPI = AuthAPI();
  final UserVerificationApi _userVerificationApi = UserVerificationApi();
  final SharedPreferencesService _sharedPreferences = Get.find<SharedPreferencesService>();
  Rx<UserLoginInfoModel?> userLoginInfo = Rx<UserLoginInfoModel?>(null);
  // var isLoading = false.obs;

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
      final controller = passwordController;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
    }
  }

  // Function to handle login
  Future<void> login(String email, String password) async {
    try { 
      signinSignupNavigationController.isLoading(true);

      final response = await _authAPI.authenticateUser(email, password);

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(response.data['access_token']);
        userLoginInfo.value = UserLoginInfoModel(
          userId: decodedToken['user_id'],
          username: decodedToken['name'],
          email: decodedToken['email'],
          roles: decodedToken['roles']?.cast<String?>(),
          photo: decodedToken['photo'],
          isVerified: decodedToken['is_verified'],
          iat: decodedToken['iat'],
          exp: decodedToken['exp']
        );

        _sharedPreferences.saveString('token', response.data['access_token']);
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

        Get.offAllNamed('/landing_mobile');
      } else if (response.data['statusCode'] == 401) {
        
        _sharedPreferences.saveString('email', email);
        sendVerificationMail(email);
        signinSignupNavigationController.navigateTo(4); // Navigate to Signup Verification
      } else if (response.data['statusCode'] == 404) {
        handleLoginError('User not found, Sign Up first.', '');
      }
    } catch (e) {
      // Handle errors (show snackbar, etc.)
      handleLoginError('Incorrect EMAIL or PASSWORD', '');
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
      handleLoginError('Incorrect EMAIL or PASSWORD', '');
    } finally {
      signinSignupNavigationController.isLoading(false);
    }
  }

  void handleLoginError(String errorTitle, String errorMessage) {
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

  // Function to load saved credentials
  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString('emailForRememberMe') ?? '';
    passwordController.text = prefs.getString('passwordForRememberMe') ?? '';
    checkedRememberMe.value = email.isNotEmpty && passwordController.text.isNotEmpty;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   passwordController.text = password.value;
  // }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
}