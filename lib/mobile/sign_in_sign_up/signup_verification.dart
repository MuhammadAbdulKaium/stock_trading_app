import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:stock_trading_app/controller/signup_verification_controller.dart';

class SignupVerification extends StatelessWidget {
  const SignupVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> resetPasswordFormkey = GlobalKey<FormState>();
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
                  key: resetPasswordFormkey,
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

                      // Obx(() => 
                      Flex(
                        direction: Axis.horizontal,
                        children: List.generate(9, (index) {
                          if(index % 2 == 0) {
                            int fieldIndex = index ~/ 2;
                            return Expanded(
                              flex: 12,
                              child: TextFormField(
                                controller: signupVerificationController.codeControllers[fieldIndex],
                                focusNode: signupVerificationController.focusNodes[fieldIndex],
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: const Color(0xFFF4FCF7),
                                  counterText: "",
                                  // errorText: signupVerificationController.isValidationAttempted.value &&
                                  //         !signupVerificationController.isCodeValid.value
                                  //     ? (fieldIndex == 0 ? null : null)
                                  //     : null, // Empty string to show error only once
                                  contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.02430, horizontal: screenHeight * 0.0115131578947),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF008037), width: 0.8,),
                                    borderRadius: BorderRadius.all(Radius.circular(7),),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF008037), width: 0.8,),
                                    borderRadius: BorderRadius.all(Radius.circular(7),),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1 && fieldIndex < 4) {
                                    signupVerificationController.focusNodes[fieldIndex + 1].requestFocus();
                                  } else if (value.isEmpty && fieldIndex > 0) {
                                    signupVerificationController.focusNodes[fieldIndex - 1].requestFocus();
                                  }
                                  signupVerificationController.validateCode();
                                },
                                onFieldSubmitted: (value) {
                                  signupVerificationController.validateCode();
                                },
                                onTap: () async {
                                  final clipboardData =
                                      await Clipboard.getData('text/plain');
                                  if (clipboardData?.text != null &&
                                      clipboardData?.text!.length == 5) {
                                    signupVerificationController.handlePaste(clipboardData!.text!);
                                  }
                                },
                              ),
                            );
                          } else {
                            // Spacers between input fields
                            return const Spacer(flex: 3);
                          }
                        }),
                      ),
                      // ),

                      // Obx(() => Visibility(
                      //     visible: !signupVerificationController.isCodeValid.value && signupVerificationController.isValidationAttempted.value,
                      //     child: const Row(
                      //       children: [
                      //         Padding(
                      //           padding: EdgeInsets.only(top: 8.0, left: 11),
                      //           child: Text(
                      //             'Invalid Code',
                      //             style: TextStyle(
                      //               fontSize: 10.85, 
                      //               fontFamily: 'Gilroy',
                      //               // height: 0.5, 
                      //               fontWeight: FontWeight.w500,
                      //               color: Color(0xFFB32921)
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   )
                      // ),
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
                            signupVerificationController.verifyEmail(signupVerificationController.verificationCodeByUser);
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