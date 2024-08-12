import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
// import 'package:stock_trading_app/controller/reset_password_controller.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/controller/signup_controller.dart';

// final ResetPasswordController _resetPasswordController = Get.put(ResetPasswordController());
// final SignupController _signupController = Get.put(SignupController());
// final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> resetPasswordFormkey = GlobalKey<FormState>();
    final SignupController signupController = Get.put(SignupController());
    final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // SizedBox(height: screenHeight * 0.054,),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 26.2.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1D192B)
                        ),
                      ),
                      // SizedBox(height: screenHeight * 0.0375,),
                      Flexible(
                        flex: 70,
                        child: Container()
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Full Name',
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
                        controller: TextEditingController(text: signupController.fullName.value),
                        onChanged: signupController.signUpValidateName,
                        keyboardType: TextInputType.text,
                        hintText: 'John Doe',
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
                        contentPaddingVertical: screenWidth * 0.02430,
                        contentPaddingHorizontal: screenHeight * 0.0115131578947,
                        validator: (value) {
                          signupController.signUpValidateName;
                          if (value.trim().isEmpty) {
                            return 'Full Name is required';
                          } else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Enter a valid Name';
                          }
                          return null;
                        },
                      ),
                      // SizedBox(height: screenHeight * 0.03175,),
                      Flexible(
                        flex: 60,
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
                        controller: TextEditingController(text: signupController.email.value),
                        onChanged: signupController.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'e.g. john@gmail.com',
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
                        contentPaddingVertical: screenWidth * 0.02430,
                        contentPaddingHorizontal: screenHeight * 0.0115131578947,
                        validator: (value) {
                          signupController.validateEmail;
                          if (value.trim().isEmpty) {
                            return 'Email is required';
                          } else if (!GetUtils.isEmail(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      // SizedBox(height: screenHeight * 0.03175,),
                      Flexible(
                        flex: 60,
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
                          onChanged: signupController.updatePassword,
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
                          contentPaddingVertical: screenWidth * 0.02430,
                          contentPaddingHorizontal: screenHeight * 0.0115131578947,
                          obsecure: !signupController.isPasswordVisible.value,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: screenWidth * 0.0802083,
                              width: screenWidth * 0.0802083,
                              child: IconButton(
                                icon: Icon(signupController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility, size: screenWidth * 0.04131944444444444),
                                onPressed: () {
                                  signupController.passwordVisibility();
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
                          },
                        ),
                      ),
                      // SizedBox(height: screenHeight * 0.03175,),
                      Flexible(
                        flex: 60,
                        child: Container()
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Re-Type Password',
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
                          onChanged: signupController.updateRetypePassword,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Enter your password again',
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
                          contentPaddingVertical: screenWidth * 0.02430,
                          contentPaddingHorizontal: screenHeight * 0.0115131578947,
                          obsecure: !signupController.isRetypePasswordVisible.value,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: screenWidth * 0.0802083,
                              width: screenWidth * 0.0802083,
                              child: IconButton(
                                icon: Icon(signupController.isRetypePasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility, size: screenWidth * 0.04131944444444444),
                                onPressed: () {
                                  signupController.retypePasswordVisibility();
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
                            } else if (value != signupController.password.value) {
                              return "Password don't match.";
                            } 
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03922,),
                      // Flexible(
                      //   flex: 75,
                      //   child: Container()
                      // ),
                      SizedBox(
                        width: double.maxFinite,
                        height: screenWidth * 0.106458333333333,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          child: Text('Create Account ',
                            style: TextStyle(
                              fontSize: 14.846666666666666.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: () {
                            if (resetPasswordFormkey.currentState!.validate()) {
                              signinSignupNavigationController.navigateTo(0);
                            }
                          },
                        ),
                      ),
                      // SizedBox(height: screenHeight * 0.03922,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 15,
          child: Column(
            children: [
              Flexible(
                flex: 13,
                child: Container()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Already have an account? ",
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
                      signinSignupNavigationController.navigateTo(0); // Navigate to SignUp
                    },
                    child: Text(
                      'Sign in',
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
              // SizedBox(height: screenHeight * 0.0736,),
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
