import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/initial_page_mobile_controller.dart';
import 'package:stock_trading_app/mobile/app_Introduction_slider.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/sign_in_sign_up.dart';

class InitialPageMobile extends StatelessWidget {
  const InitialPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final InitialPageMobileController initialPageMobileController = Get.put(InitialPageMobileController());
    return Scaffold(
      body: Center(
        child: Obx(() {
          // if (initialPageMobileController.isFirstTime.value == null) {
          //   return const CircularProgressIndicator();
          // } else 
          if (initialPageMobileController.isLoading.value) {
            return const CircularProgressIndicator(); // Show loading indicator
          } else {
            if (initialPageMobileController.isFirstTime.value) {
              return const AppIntroductionSlider();
            } else {
              return const SignInSignUpMobile();
            }
          }
          // if (initialPageMobileController.isFirstTime.value) {
          //   return const AppIntroductionSlider();
          // } else {
          //   return const SignInSignUpMobile();
          // }
        }),
      ),
    );
  }
}