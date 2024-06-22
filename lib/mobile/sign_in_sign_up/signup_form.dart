import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
// import 'package:stock_trading_app/controller/reset_password_controller.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/controller/signup_controller.dart';

// final ResetPasswordController _resetPasswordController = Get.put(ResetPasswordController());
final SignupController _signupController = Get.put(SignupController());
final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> resetPasswordFormkey = GlobalKey<FormState>();

    return Column(
      children: [
        Flexible(
          flex: 48,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: Container(),
              ),
              Flexible(
                flex: 44,
                child: Form(
                  key: resetPasswordFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1D192B)
                        ),
                      ),
                      Flexible(
                        flex: 70,
                        child: Container()
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Full Name',
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
                        controller: TextEditingController(text: _signupController.fullName.value),
                        onChanged: _signupController.signUpValidateName,
                        keyboardType: TextInputType.text,
                        hintText: 'John Doe',
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
                        contentPaddingVertical: 10,
                        contentPaddingHorizontal: 10,
                        validator: (value) {
                          _signupController.signUpValidateName;
                          if (value.trim().isEmpty) {
                            return 'Full Name is required';
                          } else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Enter a valid Name';
                          }
                          return null;
                        },
                      ),
                      Flexible(
                        flex: 60,
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
                        controller: TextEditingController(text: _signupController.email.value),
                        onChanged: _signupController.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'e.g. john@gmail.com',
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
                        contentPaddingVertical: 10,
                        contentPaddingHorizontal: 10,
                        validator: (value) {
                          _signupController.validateEmail;
                          if (value.trim().isEmpty) {
                            return 'Email is required';
                          } else if (!GetUtils.isEmail(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      Flexible(
                        flex: 60,
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
                          onChanged: _signupController.updatePassword,
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
                          contentPaddingVertical: 10,
                          contentPaddingHorizontal: 10,
                          obsecure: !_signupController.isPasswordVisible.value,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: 33,
                              width: 33,
                              child: IconButton(
                                icon: Icon(_signupController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility, size: 17),
                                onPressed: () {
                                  _signupController.passwordVisibility();
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
                        flex: 60,
                        child: Container()
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Re-Type Password',
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
                          onChanged: _signupController.updateRetypePassword,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Enter your password again',
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
                          contentPaddingVertical: 10,
                          contentPaddingHorizontal: 10,
                          obsecure: !_signupController.isRetypePasswordVisible.value,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: 33,
                              width: 33,
                              child: IconButton(
                                icon: Icon(_signupController.isRetypePasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility, size: 17),
                                onPressed: () {
                                  _signupController.retypePasswordVisibility();
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
                            } else if (value != _signupController.password.value) {
                              return "Password don't match.";
                            } 
                            return null;
                          },
                        ),
                      ),
                      Flexible(
                        flex: 75,
                        child: Container()
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 43.8,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          child: const Text('Create Account ',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: () {
                            if (resetPasswordFormkey.currentState!.validate()) {
                              _signinSignupNavigationController.navigateTo(0);
                            }
                          },
                        ),
                      ),
                      // Flexible(
                      //   flex: 30,
                      //   child: Container()
                      // ),
                    ],
                  ),
                ),
              ),
              // Flexible(
              //   flex: 2,
              //   child: Container(),
              // ),
            ],
          ),
        ),
        Flexible(
          flex: 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 13,
                child: Container()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Already have an account? ",
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
                      _signinSignupNavigationController.navigateTo(0); // Navigate to SignUp
                    },
                    child: const Text(
                      'Sign in',
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
                flex: 9,
                child: Container()
              ),
            ],
          ),
        ),
      ],
    );
  }
}
