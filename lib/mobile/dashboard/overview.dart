import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_dropdown_button.dart';
import 'package:stock_trading_app/controller/dashboard_controller.dart';

final DashboardController dashboardController = Get.put(DashboardController());

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
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
              Text(
                'Overview',
                style: TextStyle(
                  fontSize: 17.25.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D192B),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Text(
              //   '৳200',
              //   style: TextStyle(
              //     fontSize: 17.25.sp,
              //     fontFamily: 'Gilroy',
              //     fontWeight: FontWeight.w700,
              //     color: const Color(0xFF1D192B),
              //     overflow: TextOverflow.ellipsis,
              //   ),
              // ),
              SizedBox(
                // width: screenWidth * 0.456,
                child: Obx(() => 
                  CommonDropdownButton(
                    padding: EdgeInsets.only(left: screenWidth * 0.022, right: screenWidth * 0.017),
                    selectedDropdownValue: dashboardController.selectedTimeframe.value,
                    allDropdownValue: dashboardController.availableTimeframeList,
                    buttonBackgroundColor: Colors.white,
                    dropdownBackgroundColor: Colors.white,
                    dropdownFontSize: 14.sp,
                    dropdownListFontSize: 14.sp,
                    dropdownOptionsSize: 25,
                    borderWidth: 1,
                    borderSideColor: const Color(0xFFE4E4E7),
                    width: screenWidth * 0.456,
                    height: screenWidth > 340 ? screenWidth * 0.094 : 35,
                    onChanged: (value) {
                      dashboardController.changeSelectedTimeframe(value!);
                      // dashboardController.selectedTimeframe.value = value.toString();
                    }
                  ),
                )
              )
            ],
          )
        ),
        Expanded(
          flex: 5,
          child: Container()
        ),
      ],
    );
  }
}