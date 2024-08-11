import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/reset_password_controller.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';

// final ResetPasswordController _resetPasswordController = Get.put(ResetPasswordController());
// final SigninSignupNavigationController _signinSignupNavigationController = Get.find<SigninSignupNavigationController>();

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> resetPasswordFormkey = GlobalKey<FormState>();
    final ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());
    final SigninSignupNavigationController signinSignupNavigationController = Get.find<SigninSignupNavigationController>();

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
                      const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1D192B)
                        ),
                      ),
                      Flexible(
                        flex: 38,
                        child: Container()
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Code from Email',
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

                      Obx(() => Flex(
                        direction: Axis.horizontal,
                        children: List.generate(9, (index) {
                          if(index % 2 == 0) {
                            int fieldIndex = index ~/ 2;
                            return Expanded(
                              flex: 12,
                              child: TextFormField(
                                controller: resetPasswordController.codeControllers[fieldIndex],
                                focusNode: resetPasswordController.focusNodes[fieldIndex],
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: const Color(0xFFF4FCF7),
                                  counterText: "",
                                  errorText: resetPasswordController.isValidationAttempted.value &&
                                          !resetPasswordController.isCodeValid.value
                                      ? (fieldIndex == 0 ? null : null)
                                      : null, // Empty string to show error only once
                                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                    resetPasswordController.focusNodes[fieldIndex + 1].requestFocus();
                                  } else if (value.isEmpty && fieldIndex > 0) {
                                    resetPasswordController.focusNodes[fieldIndex - 1].requestFocus();
                                  }
                                  resetPasswordController.validateCode();
                                },
                                onFieldSubmitted: (value) {
                                  resetPasswordController.validateCode();
                                },
                                onTap: () async {
                                  final clipboardData =
                                      await Clipboard.getData('text/plain');
                                  if (clipboardData?.text != null &&
                                      clipboardData?.text!.length == 5) {
                                    resetPasswordController.handlePaste(clipboardData!.text!);
                                  }
                                },
                              ),
                            );
                          } else {
                            // Spacers between input fields
                            return const Spacer(flex: 3);
                          }
                        }),
                      )),

                      Obx(() => Visibility(
                          visible: !resetPasswordController.isCodeValid.value && resetPasswordController.isValidationAttempted.value,
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, left: 11),
                                child: Text(
                                  'Invalid Code',
                                  style: TextStyle(
                                    fontSize: 10.85, 
                                    fontFamily: 'Gilroy',
                                    // height: 0.5, 
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFB32921)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      Flexible(
                        flex: 10,
                        child: Container()
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'New Password',
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
                          // controller: TextEditingController(text: resetPasswordController.newPassword.value),
                          onChanged: resetPasswordController.updatePasswordVariable,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Enter your new password here',
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
                          obsecure: !resetPasswordController.isPasswordVisible.value,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: 33,
                              width: 33,
                              child: IconButton(
                                icon: Icon(resetPasswordController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility, size: 17),
                                onPressed: () {
                                  resetPasswordController.passwordVisibility();
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
                        flex: 19,
                        child: Container()
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 43.8,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          child: const Text('Reset Password',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: () {
                            resetPasswordController.validationAttempt();
                            if (resetPasswordFormkey.currentState!.validate()) {
                              if(resetPasswordController.isCodeValid.value) {
                                resetPasswordController.resetPassword(resetPasswordController.confirmationCodeByUser, resetPasswordController.newPassword.value);
                              }
                              // resetPasswordController.resetPassword(resetPasswordController.confirmationCodeByUser, resetPasswordController.newPassword.value);
                            }
                          },
                        ),
                      ),
                      Flexible(
                        flex: 30,
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
