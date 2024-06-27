// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/home_page_controller.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';

final LandingPageController landingPageController = Get.find<LandingPageController>();
final HomePageController homePageController = Get.put(HomePageController());

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                    'Hello, ${homePageController.extractFirstName(landingPageController.userName.value)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1D192B),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                  const SizedBox(height: 5,),
                  const Text(
                    'What do you want to do?',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA1A1AA),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const CircleAvatar(
                radius: 21,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/blank_profile_picture.jpg'),
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