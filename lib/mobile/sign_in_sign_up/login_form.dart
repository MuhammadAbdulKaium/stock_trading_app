import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/custom_check_box.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/login_controller.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/authentication_with_social_media.dart';

// final LoginController loginController = Get.find<LoginController>();
// final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
    final LoginController loginController = Get.find<LoginController>();
    final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
    return Column(
      children: [
        Flexible(
          flex: 42,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: Container(),
              ),
              Flexible(
                flex: 36,
                child: Form(
                  key: loginFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1D192B)
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container()
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 15.2,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF27272A)
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextInputField(
                        controller: TextEditingController(text: loginController.email.value),
                        onChanged: loginController.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Enter your email here',
                        hintStyle: const TextStyle(color: Color(0xFFA1A1AA), fontFamily: 'Gilroy', fontSize: 15, fontWeight: FontWeight.w500),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF191414),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500
                        ),
                        errorStyle: const TextStyle(
                          fontSize: 11, 
                          fontFamily: 'Gilroy',
                          height: 0.5, 
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: const Color(0xFFF4FCF7),
                        contentPaddingVertical: 11,
                        contentPaddingHorizontal: 10,
                        validator: (value) {
                          loginController.validateEmail;
                          if (value.trim().isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!GetUtils.isEmail(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      Flexible(
                        flex: 4,
                        child: Container()
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 15.2,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF27272A)
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(() => 
                        TextInputField(
                          // controller: TextEditingController(text: loginController.password.value),
                          onChanged: loginController.updatePasswordVariable,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Enter your password here',
                          hintStyle: const TextStyle(color: Color(0xFFA1A1AA), fontFamily: 'Gilroy', fontSize: 15, fontWeight: FontWeight.w500),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF191414),
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500
                          ),
                          errorStyle: const TextStyle(
                            fontSize: 11, 
                            fontFamily: 'Gilroy',
                            height: 0.5, 
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          isDense: true,
                          filled: true,
                          fillColor: const Color(0xFFF4FCF7),
                          contentPaddingVertical: 11,
                          contentPaddingHorizontal: 10,
                          obsecure: !loginController.isPasswordVisible.value,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: 33,
                              width: 33,
                              child: IconButton(
                                icon: Icon(loginController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility, size: 17),
                                onPressed: () {
                                  loginController.passwordVisibility();
                                },
                              ),
                            ),
                          ),
                          suffixIconConstraints: const BoxConstraints(maxHeight: 35, maxWidth: 40),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Password cannot be empty';
                            } else if (value.trim().length < 7) {
                              return 'Password must be at least 7 characters long';
                            } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return 'Must contain a special [!@....] character.';
                            } 
                            return null;
                          },
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container()
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => CustomCheckBox(
                              checkBoxLabel: 'Remember me',
                              isChecked: loginController.checkedRememberMe.value,
                              onChanged: (bool? value) {
                                loginController.checkedRememberMe.value = !loginController.checkedRememberMe.value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: GestureDetector(
                              onTap: () async {
                                // Get.toNamed("/forget_password");
                                signinSignupNavigationController.navigateTo(1); // Navigate to ForgetPassword
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF71717A),
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // const SizedBox(height: 29,),
                      Flexible(
                        flex: 4,
                        child: Container()
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 43.8,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          child: const Text('Login',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: () {
                            if (loginFormkey.currentState!.validate()) {
                              loginController.login(loginController.email.value, loginController.password.value);
                  
                              // Get.offNamed('/landing');
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     content: Text('Grate!',
                              //       style: TextStyle(
                              //         fontSize: 12,
                              //         color: Color.fromARGB(255, 255, 255, 255),
                              //         fontFamily: 'FontCircularStd',
                              //         fontWeight: FontWeight.w400
                              //       ),
                              //     ),
                              //   ),
                              // );
                            }
                          },
                        ),
                      ),
                      Flexible(
                        flex: 10,
                        child: Container()
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 21,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 0,
                      thickness: 0.8,
                      color: Color(0xFFCFCFCF),
                    ),
                  )
                ],
              ),
              Flexible(
                flex: 4,
                child: Container()
              ),
              const Text('Or continue with',
                style: TextStyle(
                  fontSize: 15.1,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF008037)
                ),
              ),
              Flexible(
                flex: 5,
                child: Container()
              ),
              const AuthenticationWithSocialMedia(),
              Flexible(
                flex: 9,
                child: Container()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF71717A),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500
                    )
                  ),
                  GestureDetector(
                    onTap: () {
                      // signInAndSignUpController.onClose();
                      // signInAndSignUpController.toggleSignInSignUp();
                      signinSignupNavigationController.navigateTo(3); // Navigate to SignUp
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 12.3,
                        color: Color(0xFF008037),
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 13,
                child: Container()
              ),
              // const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}