import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/custom_check_box.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/login_controller.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/authentication_with_social_media.dart';

final LoginController loginController = Get.put(LoginController());

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1D192B)
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18.5),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF27272A)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 43.5,
              child: TextInputField(
                // onChanged: signInAndSignUpController.validateEmail,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter your email here',
                hintStyle: const TextStyle(color: Color(0xFFA1A1AA), fontFamily: 'Gilroy', fontSize: 15, fontWeight: FontWeight.w500),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                filled: true,
                fillColor: const Color(0xFFF4FCF7),
                validator: (value) {
                  if (value == null) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                // validator: (value) {
                //   signInAndSignUpController.validateEmail;
                //   if (value == null ||
                //       value.isEmpty ||
                //       !signInAndSignUpController.isValidEmail.value) {
                //     return 'Enter a valid email address';
                //   }
                //   return null;
                // },
              ),
            ),
            const SizedBox(height: 29,),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF27272A)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 43.5,
              child: TextInputField(
                // onChanged: signInAndSignUpController.validateEmail,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter your password here',
                hintStyle: const TextStyle(color: Color(0xFFA1A1AA), fontFamily: 'Gilroy', fontSize: 15, fontWeight: FontWeight.w500),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                filled: true,
                fillColor: const Color(0xFFF4FCF7),
                validator: (value) {
                  if (value == null) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                // validator: (value) {
                //   signInAndSignUpController.validateEmail;
                //   if (value == null ||
                //       value.isEmpty ||
                //       !signInAndSignUpController.isValidEmail.value) {
                //     return 'Enter a valid email address';
                //   }
                //   return null;
                // },
              ),
            ),
            const SizedBox(height: 18,),
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
                    onTap: () async {},
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
            const SizedBox(height: 29,),
            SizedBox(
              width: double.maxFinite,
              height: 43.8,
              child: CommonButton(
                borderRadius: 8,
                backgroundColor: const Color(0xFF008037),
                onPressed: () {},
                child: const Text('Login',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 65,),
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
            const Padding(
              padding: EdgeInsets.only(top: 20.2, bottom: 22),
              child: Text('Or continue with',
                style: TextStyle(
                  fontSize: 15.1,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF008037)
                ),
              ),
            ),
            const AuthenticationWithSocialMedia(),
            const SizedBox(height: 46.5,),
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
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}