  // import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/home_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:intl/intl.dart';

// final HomePageController homePageController = Get.put(HomePageController());

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              child: Text(
                'Summary',
                style: TextStyle(
                  fontSize: 17.25.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D192B),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.0190,),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4FCF7),
                  borderRadius: BorderRadius.circular(10),
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
                child: GridView.count(
                  shrinkWrap: true, // Add shrinkWrap
                  primary: false,
                  childAspectRatio: 1.24,
                  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5, right: 5),
                  // crossAxisSpacing: 10,
                  // mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color: Colors.teal[100],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CustomIcons.dollarCircle,
                              color: const Color(0xFF008037),
                              size: screenWidth * 0.1010,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 9.13, bottom: 3),
                              child: Text("Active Investments",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFA1A1AA),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Obx(() => 
                              Text(NumberFormat.decimalPattern().format(homePageController.activeInvestments.value).length == 1 ? '0${NumberFormat.decimalPattern().format(homePageController.activeInvestments.value)}' : NumberFormat.decimalPattern().format(homePageController.activeInvestments.value),
                                style: TextStyle(
                                  fontSize: 22.3.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF08602E),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color: Colors.teal[100],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CustomIcons.information,
                              color: const Color(0xFF008037),
                              size: screenWidth * 0.1010,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 9.13, bottom: 3),
                              child: Text("Action Required",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFA1A1AA),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Obx(() => 
                              Text(NumberFormat.decimalPattern().format(homePageController.actionRequired.value).length == 1 ? '0${NumberFormat.decimalPattern().format(homePageController.actionRequired.value)}' : NumberFormat.decimalPattern().format(homePageController.actionRequired.value),
                                style: TextStyle(
                                  fontSize: 22.3.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF08602E),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color: Colors.teal[100],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CustomIcons.moneySend,
                              color: const Color(0xFF008037),
                              size: screenWidth * 0.1010,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 9.13, bottom: 3),
                              child: Text("Currently Invested",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFA1A1AA),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Obx(() => 
                              Text('${NumberFormat.decimalPattern().format(homePageController.currentlyInvested.value)} TK',
                                style: TextStyle(
                                  fontSize: 22.3.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF08602E),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color: Colors.teal[100],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CustomIcons.wallet,
                              color: const Color(0xFF008037),
                              size: screenWidth * 0.1010,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 9.13, bottom: 3),
                              child: Text("Withdrawable",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFA1A1AA),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Obx(() => 
                              Text('${NumberFormat.decimalPattern().format(homePageController.withdrawable.value)} TK',
                                style: TextStyle(
                                  fontSize: 22.3.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF08602E),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color: Colors.teal[100],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CustomIcons.trendUp,
                              color: const Color(0xFF008037),
                              size: screenWidth * 0.1010,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 9.13, bottom: 3),
                              child: Text("Current Profit",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFA1A1AA),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Obx(() => 
                              Text('${NumberFormat.decimalPattern().format(homePageController.currentProfit.value)} TK',
                                style: TextStyle(
                                  fontSize: 22.3.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF08602E),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(8),
                    //   color: Colors.teal[600],
                    //   child: const Text('Revolution, they...'),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        ),
      ],
    );
  }
}