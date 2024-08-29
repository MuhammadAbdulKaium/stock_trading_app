import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/profile_controller.dart';
import 'package:stock_trading_app/mobile/profile/banking.dart';
import 'package:stock_trading_app/mobile/profile/nominee.dart';
import 'package:stock_trading_app/mobile/profile/personal.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.03,),
          Container(
            padding: EdgeInsets.all(screenWidth * 0.0121528),
            decoration: BoxDecoration(
              color: const Color(0xFFF4FCF7),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: -2.5,
                  blurRadius: 8.5,
                  offset: const Offset(0, 5),
                ),
                // BoxShadow(
                //   color: Colors.grey.withOpacity(0.5),
                //   spreadRadius: 0,
                //   blurRadius: 2,
                //   offset: const Offset(0, 1),
                // ),
              ],
            ),
            child: SizedBox(
              height: screenWidth * 0.0729166,
              width: screenWidth * 0.675,
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: profileController.tabController,
                tabs: const [
                  Tab(text: 'Personal'),
                  Tab(text: 'Banking'),
                  Tab(text: 'Nominee'),
                ],
                // Customize the appearance of the TabBar
                labelColor: const Color(0xFFFFFFFF), // Color of the selected tab's text
                unselectedLabelColor: const Color(0xFF1D192B), // Color of the unselected tab's text
                labelStyle: TextStyle(
                  fontSize: 13.63.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ), // Style for selected tab's text
                unselectedLabelStyle: TextStyle(
                  fontSize: 13.63.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ), // Style for unselected tab's text
                indicator: BoxDecoration(
                  color: const Color(0xFF008037), // Background color for the indicator
                  borderRadius: BorderRadius.circular(5.0), // Rounded corners for the indicator
                ),
                indicatorSize: TabBarIndicatorSize.tab, // Make the indicator size equal to the tab
                indicatorPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.005, vertical: 0),
                labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              ),
            ),
          ),
          Obx(() {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: profileController.tabColor.value,
              height: profileController.tabHeight.value.sp,
              child: TabBarView(
                controller: profileController.tabController,
                children: const <Widget>[
                  // Personal Tab Content
                  Personal(),
              
                  // Banking Tab Content
                  Banking(),
              
                  // Nominee Tab Content
                  Nominee(),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}