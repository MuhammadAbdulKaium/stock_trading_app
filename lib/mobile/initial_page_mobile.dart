import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/initial_page_mobile_controller.dart';

class InitialPageMobile extends StatelessWidget {
  const InitialPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final InitialPageMobileController initialPageMobileController = Get.put(InitialPageMobileController(), permanent: true,);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(() {
          if (initialPageMobileController.isLoading.value) {
            return const CustomLoader(); // Show loading indicator
          } else {
            return const SizedBox.shrink(); // Return an empty widget if loading is done
          }
        }),
      ),
    );
  }
}