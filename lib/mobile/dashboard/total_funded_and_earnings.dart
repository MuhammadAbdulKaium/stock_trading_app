import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/dashboard_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

// final DashboardController dashboardController = Get.put(DashboardController());

class TotalFundedAndEarnings extends StatelessWidget {
  const TotalFundedAndEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.put(DashboardController());
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: GridView.count(
                shrinkWrap: true, // Add shrinkWrap
                primary: false,
                childAspectRatio: 1.00,
                padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  Column(
                    children: [
                      Flexible(
                        flex: 100,
                        child: Container(
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
                              Flexible(
                                flex: 30,
                                child: Column(
                                  children: [
                                    Flexible(flex: 7, child: Container()),
                                    Flexible(
                                      flex: 24,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                flex: 8,
                                                child: Container()
                                              ),
                                              Flexible(
                                                flex: 84,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xFFF4FCF7),
                                                        borderRadius: BorderRadius.circular(6),
                                                      ),
                                                      height: screenWidth * 0.088,
                                                      width: screenWidth * 0.088,
                                                      child: Center(
                                                        child: Icon(
                                                          CustomIcons.donate,
                                                          color: const Color(0xFF008037),
                                                          size: screenWidth * 0.047,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      CustomIcons.dotsThreeOutline,
                                                      color: const Color(0xFF1D192B),
                                                      size: screenWidth * 0.048,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 8,
                                                child: Container()
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              Flexible(
                                flex: 23,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 22,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                            Text(
                                            'Total Funded',
                                            style: TextStyle(
                                              fontSize: 11.5.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF1D192B),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(flex: 1, child: Container()),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 46,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '৳',
                                          style: TextStyle(
                                            fontSize: 33.sp,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF008037),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Obx(() => 
                                          Text(
                                            dashboardController.totalFunded.value.toString(),
                                            style: TextStyle(
                                              fontSize: 33.sp,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFF008037),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Flexible(
                        flex: 100,
                        child: Container(
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
                              Flexible(
                                flex: 30,
                                child: Column(
                                  children: [
                                    Flexible(flex: 7, child: Container()),
                                    Flexible(
                                      flex: 24,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                flex: 8,
                                                child: Container()
                                              ),
                                              Flexible(
                                                flex: 84,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xFFF4FCF7),
                                                        borderRadius: BorderRadius.circular(6),
                                                      ),
                                                      height: screenWidth * 0.088,
                                                      width: screenWidth * 0.088,
                                                      child: Center(
                                                        child: Icon(
                                                          CustomIcons.healthiconsMoneyBag,
                                                          color: const Color(0xFF008037),
                                                          size: screenWidth * 0.047,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      CustomIcons.dotsThreeOutline,
                                                      color: const Color(0xFF1D192B),
                                                      size: screenWidth * 0.048,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 8,
                                                child: Container()
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              Flexible(
                                flex: 23,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 22,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                            Text(
                                            'Total Earnings',
                                            style: TextStyle(
                                              fontSize: 11.5.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF1D192B),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(flex: 1, child: Container()),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 46,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '৳',
                                          style: TextStyle(
                                            fontSize: 33.sp,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF008037),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Obx(() => 
                                          Text(
                                            dashboardController.totalEarnings.value.toString(),
                                            style: TextStyle(
                                              fontSize: 33.sp,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFF008037),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        )
      ],
    );
  }
}