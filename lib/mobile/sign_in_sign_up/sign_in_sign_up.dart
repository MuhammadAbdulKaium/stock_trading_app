import 'package:flutter/material.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() => 
            PopScope(
              canPop: signinSignupNavigationController.canGoBack.value,
              onPopInvoked: (_) async {
                await signinSignupNavigationController.onWillPop();
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.08506944444, right: screenWidth * 0.08506944444),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 11,
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      // width: screenWidth * 0.35704861111,
                                      height: screenHeight * 0.0851973684210,
                                      child: Image.asset(
                                        'images/app_icon_inner_page.png',
                                        fit: BoxFit.contain,
                                        // width: screenWidth * 0.35704861111,
                                        height: screenHeight * 0.0851973684210,
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

          Obx(() {
            return signinSignupNavigationController.isLoading.value ? const CustomLoader() : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}