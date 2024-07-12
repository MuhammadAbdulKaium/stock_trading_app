// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/home_page_controller.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';

// final LandingPageController landingPageController = Get.find<LandingPageController>();
// final HomePageController homePageController = Get.put(HomePageController());

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    // final LandingPageController landingPageController = Get.find<LandingPageController>();
    final LandingPageController landingPageController = Get.put(LandingPageController());
    final HomePageController homePageController = Get.put(HomePageController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container()
        ),
        Expanded(
          flex: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                    'Hello, ${homePageController.extractFirstName(landingPageController.userName.value)}',
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1D192B),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                  SizedBox(height: screenHeight * 0.006410,),
                  Text(
                    'What do you want to do?',
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFA1A1AA),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              CircleAvatar(
                radius: screenWidth * 0.0540,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage('images/blank_profile_picture.jpg'),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container()
        ),
      ],
    );
  }
}