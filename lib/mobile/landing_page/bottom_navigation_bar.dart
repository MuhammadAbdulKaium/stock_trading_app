import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final LandingPageController landingPageController = Get.find<LandingPageController>();
    final LandingPageController landingPageController = Get.put(LandingPageController());

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 22, left: 18, right: 18),
        child: Obx(() => GNav(
          // backgroundColor: Colors.black12,
          color: const Color(0xFF686870),
          activeColor: const Color(0xFF008037),
          tabBackgroundColor: const Color(0xFFF4FCF7),
          gap: 7,
          iconSize: 23,
          textStyle: const TextStyle(fontSize: 13, color: Color(0xFF008037)),
          padding: const EdgeInsets.only(left: 13, right: 10, top: 9.5, bottom: 9.5),
          tabs: [
            GButton(
              icon: landingPageController.selectedPageIndex.value == 0? CustomIcons.homeFill : CustomIcons.homeOutline,
              text: 'Home',
              onPressed: () => landingPageController.changePage(0),
            ),
            GButton(
              icon: landingPageController.selectedPageIndex.value == 1? CustomIcons.investmentsFill : CustomIcons.investmentsOutline,
              text: 'Investment',
              onPressed: () => landingPageController.changePage(1),
            ),
            GButton(
              icon: landingPageController.selectedPageIndex.value == 2? CustomIcons.marketplaceFill : CustomIcons.marketplaceOutline,
              text: 'Marketplace',
              onPressed: () => landingPageController.changePage(2),
            ),
            GButton(
              icon: landingPageController.selectedPageIndex.value == 3? CustomIcons.dashboardFill : CustomIcons.dashboardOutline,
              text: 'Dashboard',
              onPressed: () => landingPageController.changePage(3),
            ),
            GButton(
              icon: landingPageController.selectedPageIndex.value == 4? CustomIcons.profileFill : CustomIcons.profileOutline,
              text: 'Profile',
              onPressed: () => landingPageController.changePage(4),
            ),
          ],
          selectedIndex: landingPageController.selectedPageIndex.value,
        ),),
      ),
    );
  }
}