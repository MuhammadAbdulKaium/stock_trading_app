import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    final LandingPageController landingPageController = Get.put(LandingPageController());

    return Obx(() { 
      // int selectedIndex = landingPageController.selectedPageIndex.value;
      // bool isActive = landingPageController.selectedPageIndex.value <= 4;
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 221, 221, 226),
              width: 1,
            ),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: const Color(0xFFF4FCF7),
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  fontSize: 11.4.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF008037),
                  overflow: TextOverflow.ellipsis,
                );
              }
              return TextStyle(
                fontSize: 11.4.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                color: const Color(0xFF71717A),
                overflow: TextOverflow.ellipsis,
              );
            }),
            iconTheme: WidgetStateProperty.all(
              const IconThemeData(color: Color(0xFF71717A)),
            ),
          ),
          child: NavigationBar(
            animationDuration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            onDestinationSelected: (int index) {
              landingPageController.changePage(index);
              // landingPageController.update();
            },
            selectedIndex: landingPageController.bottomNavigationPageIndex.value,
            destinations: <NavigationDestination>[
              NavigationDestination(
                selectedIcon: Icon(CustomIcons.homeFill, color: const Color(0xFF008037), size: screenWidth * 0.064),
                icon: Icon(CustomIcons.homeOutline, size: screenWidth * 0.064),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(CustomIcons.investmentsFill, color: const Color(0xFF008037), size: screenWidth * 0.065),
                icon: Icon(CustomIcons.investmentsOutline, size: screenWidth * 0.065),
                label: 'Investment',
              ),
              NavigationDestination(
                selectedIcon: Icon(CustomIcons.marketplaceFill, color: const Color(0xFF008037), size: screenWidth * 0.059),
                icon: Icon(CustomIcons.marketplaceOutline, size: screenWidth * 0.059),
                label: 'Marketplace',
              ),
              NavigationDestination(
                selectedIcon: Icon(CustomIcons.dashboardFill, color: const Color(0xFF008037), size: screenWidth * 0.0625),
                icon: Icon(CustomIcons.dashboardOutline, size: screenWidth * 0.0625),
                label: 'Dashboard',
              ),
              NavigationDestination(
                selectedIcon: Icon(CustomIcons.profileFill, color: const Color(0xFF008037), size: screenWidth * 0.063),
                icon: Icon(CustomIcons.profileOutline, size: screenWidth * 0.063),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }
}