import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/controller/signup_verification_controller.dart';

class SignupVerification extends StatelessWidget {
  const SignupVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupVerificationController signupVerificationController = Get.put(SignupVerificationController());
    final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Verify Email',
                        style: TextStyle(
                          fontSize: 26.2.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1D192B)
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Verification Code from Email',
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
                      SizedBox(
                        height: 22.sp + (screenHeight * 0.0115131578947 * 2),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 5,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 22.sp + (screenHeight * 0.0115131578947 * 2),
                            fieldWidth: 13.1.sp + (screenWidth * 0.051 * 2),
                            inactiveFillColor: const Color(0xFFF4FCF7),
                            activeFillColor: const Color(0xFFF4FCF7),
                            selectedFillColor: const Color(0xFFF4FCF7),
                            activeColor: const Color(0xFF008037),
                            selectedColor: const Color.fromARGB(255, 1, 168, 73),
                            inactiveColor: const Color(0xFFF4FCF7),
                            borderWidth: 0.0,
                            activeBorderWidth: 1.0,
                            inactiveBorderWidth: 0.0,
                            selectedBorderWidth: 1.0,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onChanged: (value) {
                            signupVerificationController.verificationCode.value = value;
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03,),
                      SizedBox(
                        width: double.maxFinite,
                        height: screenWidth * 0.106458333333333,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          child: Text('Verify',
                            style: TextStyle(
                              fontSize: 14.846666666666666.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: () {
                            signupVerificationController.verifyEmail(signupVerificationController.verificationCode.value);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.013,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Didn't receive verification code? ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF71717A),
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500
                            )
                          ),
                          GestureDetector(
                            onTap: () {
                              signupVerificationController.sendVerificationMail(signupVerificationController.email.value);
                            },
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: const Color(0xFF008037),
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
                    "Return to, ",
                    style: TextStyle(
                      fontSize: 11.79.sp,
                      color: const Color(0xFF71717A),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500
                    )
                  ),
                  GestureDetector(
                    onTap: () {
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