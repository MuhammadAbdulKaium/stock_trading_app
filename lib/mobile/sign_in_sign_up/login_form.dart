import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

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
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 26.2.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1D192B)
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container()
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 13.27466666666666666.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF27272A)
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
                        hintStyle: TextStyle(color: const Color(0xFFA1A1AA), fontFamily: 'Gilroy', fontSize: 13.1.sp, fontWeight: FontWeight.w500),
                        style: TextStyle(
                          fontSize: 13.1.sp,
                          color: const Color(0xFF191414),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500
                        ),
                        errorStyle: TextStyle(
                          fontSize: 9.606666666666.sp, 
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
                        contentPaddingVertical: screenWidth * 0.026736,
                        contentPaddingHorizontal: screenWidth * 0.02430,
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 13.27466666666666666.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF27272A)
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(() => 
                        TextInputField(
                          controller: loginController.passwordController,
                          onChanged: loginController.updatePasswordVariable,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Enter your password here',
                          hintStyle: TextStyle(color: const Color(0xFFA1A1AA), fontFamily: 'Gilroy', fontSize: 13.1.sp, fontWeight: FontWeight.w500),
                          style: TextStyle(
                            fontSize: 13.1.sp,
                            color: const Color(0xFF191414),
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500
                          ),
                          errorStyle: TextStyle(
                            fontSize: 9.606666666666.sp,
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
                          contentPaddingVertical: screenWidth * 0.026736,
                          contentPaddingHorizontal: screenWidth * 0.02430,
                          obsecure: !loginController.isPasswordVisible.value,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: screenWidth * 0.0802083,
                              width: screenWidth * 0.0802083,
                              child: IconButton(
                                icon: Icon(loginController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility, size: screenWidth * 0.04131944444444444),
                                onPressed: () {
                                  loginController.passwordVisibility();
                                },
                              ),
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(maxHeight: screenWidth * 0.085069, maxWidth: screenWidth * 0.0972222),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Password cannot be empty';
                            } else if (value.trim().length < 7) {
                              return 'Password must be at least 7 characters long';
                            } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return 'Must contain a special [!@....] character.';
                            } 
                            return null;

                            // if (value.trim().isEmpty) {
                            //   return 'Password cannot be empty';
                            // } else if (value.trim().length < 7) {
                            //   return 'Password must be at least 7 characters long';
                            // }
                            // return null;
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
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontSize: 11.39666666666.sp,
                                  color: const Color(0xFF71717A),
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
                        height: screenWidth * 0.106458333333333,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          child: Text('Login',
                            style: TextStyle(
                              fontSize: 14.846666666666666.sp,
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
              Text('Or continue with',
                style: TextStyle(
                  fontSize: 13.1873333333333333.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF008037)
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
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 11.79.sp,
                      color: const Color(0xFF71717A),
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
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 10.742.sp,
                        color: const Color(0xFF008037),
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