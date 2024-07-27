import 'package:flutter/material.dart';
import 'package:stock_trading_app/controller/sign_in_sign_up_navigation_controller.dart';
import 'package:get/get.dart';
// import 'package:stock_trading_app/mobile/sign_in_sign_up/forget_password.dart';
// import 'package:stock_trading_app/controller/login_controller.dart';
// import 'package:stock_trading_app/mobile/sign_in_sign_up/login_form.dart';
// import 'package:stock_trading_app/mobile/sign_in_sign_up/reset_password.dart';
// import 'package:stock_trading_app/mobile/sign_in_sign_up/signup_form.dart';


class SignInSignUpMobile extends StatelessWidget {
  const SignInSignUpMobile({super.key});
  

  @override
  Widget build(BuildContext context) {
    final SigninSignupNavigationController signinSignupNavigationController = Get.put(SigninSignupNavigationController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => 
        PopScope(
          canPop: signinSignupNavigationController.canGoBack.value,
          onPopInvoked: (_) async {
            await signinSignupNavigationController.onWillPop();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 11,
                      child: SizedBox(
                        // height: 131,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 74,
                                  child: Image.asset(
                                    'images/app_icon_inner_page.png',
                                    fit: BoxFit.contain,
                                    height: 74,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 63,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                        child: signinSignupNavigationController.getCurrentPage(),
                        // physics: const NeverScrollableScrollPhysics(),
                        // children: const [
                        //   LoginForm(),
                        //   ForgetPassword(),
                        //   ResetPassword(),
                        //   SignupForm()
                        // ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}