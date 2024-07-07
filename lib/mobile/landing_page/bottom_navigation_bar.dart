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
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
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
            iconTheme: MaterialStateProperty.all(
              const IconThemeData(color: Color(0xFF71717A)),
            ),
          ),
          child: NavigationBar(
            animationDuration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            onDestinationSelected: (int index) {
              landingPageController.changePage(index);
            },
            // selectedIndex: isActive ? selectedIndex : 0,
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



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:stock_trading_app/controller/landing_page_controller.dart';
// import 'package:stock_trading_app/helpers/custom_icons.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final LandingPageController landingPageController = Get.find<LandingPageController>();
//     final LandingPageController landingPageController = Get.put(LandingPageController());

//     return Container(
//       // color: Colors.white,
//       decoration: BoxDecoration(
//         color: Colors.white, // Background color of the container
//         // borderRadius: BorderRadius.circular(8), // Rounded corners
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.grey.withOpacity(0.3),
//         //     spreadRadius: -2.5,
//         //     blurRadius: 8.5,
//         //     offset: const Offset(0, 5),
//         //   ),
//         // ],
//         border: Border.all(
//           color: const Color(0xFFE4E4E7), // Border color
//           width: 1, // Border width
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 12, bottom: 22, left: 18, right: 18),
//         child: Obx(() => GNav(
//           // backgroundColor: Colors.black12,
//           color: const Color(0xFF686870),
//           activeColor: const Color(0xFF008037),
//           tabBackgroundColor: const Color(0xFFF4FCF7),
//           gap: 7,
//           iconSize: 23,
//           textStyle: const TextStyle(fontSize: 13, color: Color(0xFF008037)),
//           padding: const EdgeInsets.only(left: 13, right: 10, top: 9.5, bottom: 9.5),
//           tabs: [
//             GButton(
//               icon: landingPageController.selectedPageIndex.value == 0? CustomIcons.homeFill : CustomIcons.homeOutline,
//               text: 'Home',
//               onPressed: () => landingPageController.changePage(0),
//             ),
//             GButton(
//               icon: landingPageController.selectedPageIndex.value == 1? CustomIcons.investmentsFill : CustomIcons.investmentsOutline,
//               text: 'Investment',
//               onPressed: () => landingPageController.changePage(1),
//             ),
//             GButton(
//               icon: landingPageController.selectedPageIndex.value == 2? CustomIcons.marketplaceFill : CustomIcons.marketplaceOutline,
//               text: 'Marketplace',
//               onPressed: () => landingPageController.changePage(2),
//             ),
//             GButton(
//               icon: landingPageController.selectedPageIndex.value == 3? CustomIcons.dashboardFill : CustomIcons.dashboardOutline,
//               text: 'Dashboard',
//               onPressed: () => landingPageController.changePage(3),
//             ),
//             GButton(
//               icon: landingPageController.selectedPageIndex.value == 4? CustomIcons.profileFill : CustomIcons.profileOutline,
//               text: 'Profile',
//               onPressed: () => landingPageController.changePage(4),
//             ),
//           ],
//           selectedIndex: landingPageController.selectedPageIndex.value,
//         ),),
//       ),
//     );
//   }
// }