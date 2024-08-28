// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/banking_controller.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/controller/nominee_controller.dart';
import 'package:stock_trading_app/controller/personal_controller.dart';
// import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final RxDouble tabHeight = 1.5.obs; // Default height for the first tab
  final tabColor = const Color.fromARGB(255, 255, 255, 255).obs; //const Color(0xFFF0B8AF).obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);

    final PersonalController personalController = Get.put(PersonalController());
    final BankingController bankingController = Get.put(BankingController());
    final NomineeController nomineeController = Get.put(NomineeController());
    final LandingPageController landingPageController = Get.find<LandingPageController>();

    Future.delayed(Duration.zero, () async {
      landingPageController.isLoading.value = true;

      await personalController.loadPersonalDetails();
      await bankingController.loadBankingDetails();
      await nomineeController.loadNomineeDetails();
      // await Future.delayed(Duration(milliseconds: 1000));

      landingPageController.isLoading.value = false;
    });

    // Set up a listener to update the height when the tab index changes
    tabController.addListener(() {
      switch (tabController.index) {
        case 0:
          tabHeight.value = 1.5; // Personal Tab height multiplier
          tabColor.value = const Color.fromARGB(255, 255, 255, 255); //const Color(0xFFF0B8AF);
          break;
        case 1:
          tabHeight.value = 1.3; // Banking Tab height multiplier
          tabColor.value = const Color.fromARGB(255, 175, 240, 178);
          break;
        case 2:
          tabHeight.value = 1.0; // Nominee Tab height multiplier
          tabColor.value = const Color.fromARGB(255, 179, 175, 240);
          break;
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}