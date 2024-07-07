import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/dashboard_controller.dart';

final DashboardController dashboardController = Get.put(DashboardController());

class ReadyForWithdraw extends StatelessWidget {
  const ReadyForWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            padding: EdgeInsets.only(top: screenHeight * 0.029, bottom: screenHeight * 0.031),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFE8E8EA), // Border color
                width: 1, // Border width
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Ready For Withdraw',
                  style: TextStyle(
                    fontSize: 11.25.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D192B),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: screenHeight * 0.003,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '৳',
                      style: TextStyle(
                        fontSize: 42.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF008037),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Obx(() => 
                      Text(
                        dashboardController.readyForWithdraw.value.toString(),
                        style: TextStyle(
                          fontSize: 42.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.003,),
                SizedBox(
                  width: screenWidth * 0.700,
                  height: screenHeight * 0.040,
                  child: CommonButton(
                    borderRadius: 8,
                    backgroundColor: const Color(0xFF008037),
                    child: Text('Withdraw',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    onPressed: () {
                      dashboardController.loadCashOut();
                    },
                  ),
                )
              ],
            ),
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