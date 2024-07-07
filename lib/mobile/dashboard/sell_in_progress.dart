import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/dashboard_controller.dart';
import 'package:stock_trading_app/helpers/decide_image_to_show.dart';

final DashboardController dashboardController = Get.put(DashboardController());

class SellInProgress extends StatelessWidget {
  const SellInProgress({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Sell In Progress',
                style: TextStyle(
                  fontSize: 13.5.sp,
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
        SizedBox(height: screenHeight * 0.0110,),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Container(
                padding: EdgeInsets.only(top: screenHeight * 0.015, bottom: screenHeight * 0.015),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE8E8EA), // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Obx(() {
                  if (dashboardController.sellInProgress.isEmpty) {
                    return Center(
                      child: Text(
                        'No Sell In Progress found.',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1D192B),
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      children: dashboardController.sellInProgress.map((sellInProgress) => 
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container()
                                ),
                                Expanded(
                                  flex: 92,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 18,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.2),
                                                          spreadRadius: -1.0,
                                                          blurRadius: 6.5,
                                                          offset: const Offset(0, 2),
                                                        ),
                                                        // BoxShadow(
                                                        //   color: Colors.black.withOpacity(0.2), // Shadow color
                                                        //   spreadRadius: 2, // Spread radius
                                                        //   blurRadius: 5, // Blur radius
                                                        //   offset: const Offset(0, 3), // Shadow position
                                                        // ),
                                                      ],
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: screenWidth * 0.041,
                                                      backgroundColor: const Color(0xFFF4FCF7),
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: screenWidth * 0.042,
                                                          child: decideImageToShow(sellInProgress.productCategory!),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 74,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    sellInProgress.title!,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: 'Gilroy',
                                                      fontWeight: FontWeight.w600,
                                                      color: const Color(0xFF1D192B),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '${sellInProgress.price.toString()} BDT',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF008037),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container()
                                ),
                              ],
                            ),
                            if (dashboardController.sellInProgress.indexOf(sellInProgress) != dashboardController.sellInProgress.length - 1) 
                              SizedBox(height: screenHeight * 0.015,)
                          ],
                        ),
                      ).toList()
                    );
                  }
                })
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