// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/forget_password_controller.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';

// final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
// final ForgetPasswordController _forgetPasswordController = Get.put(ForgetPasswordController());

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();
    final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
    final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  key: forgetPasswordFormkey,
                  child: Column(
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 26.2.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1D192B)
                        ),
                      ),
                      Flexible(
                        flex: 28,
                        child: Container()
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 13.2746666666666666.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF27272A)
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextInputField(
                        controller: TextEditingController(text: forgetPasswordController.email.value),
                        onChanged: forgetPasswordController.validateEmail,
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
                          forgetPasswordController.validateEmail;
                          if (value.trim().isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!GetUtils.isEmail(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      Flexible(
                        flex: 11,
                        child: Container()
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: screenWidth * 0.106458333333333,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          child: Text('Send Verification Code',
                            style: TextStyle(
                              fontSize: 14.846666666666666.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: () {
                            if (forgetPasswordFormkey.currentState!.validate()) {
                              forgetPasswordController.forgetPasswordSendCodeToEmail(forgetPasswordController.email.value);
                  
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
                        flex: 61,
                        child: Container()
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     _signinSignupNavigationController.navigateTo(2); // Navigate to ResetPassword
                      //   },
                      //   child: const Text('Next'),
                      // ),
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
              Flexible(
                flex: 13,
                child: Container()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Remember Password? ",
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
              Flexible(
                flex: 5,
                child: Container()
              ),
            ],
          ),
        ),
      ],
    );
  }
}