import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/active_investment_controller.dart';
import 'package:stock_trading_app/controller/cash_out_controller.dart';
import 'package:stock_trading_app/controller/my_investments_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

// final MyInvestmentsController myInvestmentsController = Get.put(MyInvestmentsController());

class MyInvestmentSummary extends StatelessWidget {
  const MyInvestmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final CashOutController cashOutController = Get.put(CashOutController());
    final MyInvestmentsController myInvestmentsController = Get.put(MyInvestmentsController());
    final ActiveInvestmentController activeInvestmentController = Get.put(ActiveInvestmentController());
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
                  GestureDetector(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4FCF7),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFE8E8EA), // Border color
                                width: 1, // Border width
                              ),
                            ),
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 33,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 7,
                                          child: Container()
                                        ),
                                        Flexible(
                                          flex: 93,
                                          child: Icon(
                                            CustomIcons.timer,
                                            color: const Color(0xFF008037),
                                            size: screenWidth * 0.0790,
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  Flexible(
                                    flex: 38,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Obx(() => 
                                            Text(
                                              myInvestmentsController.pendingInvestment.value,
                                              style: TextStyle(
                                                fontSize: 34.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF1D192B),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 28,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Pending Investment',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF71717A),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ) 
                                ],
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                    onTap: () {

                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4FCF7),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFE8E8EA), // Border color
                                width: 1, // Border width
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Flexible(
                                    flex: 33,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 7,
                                          child: Container()
                                        ),
                                        Flexible(
                                          flex: 93,
                                          child: Icon(
                                            CustomIcons.verify,
                                            color: const Color(0xFF008037),
                                            size: screenWidth * 0.0790,
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  Flexible(
                                    flex: 38,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Obx(() => 
                                            Text(
                                              myInvestmentsController.activeInvestment.value,
                                              style: TextStyle(
                                                fontSize: 34.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF1D192B),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 28,
                                    child: Column(
                                      children: [
                                          Text(
                                          'Active Investment',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF71717A),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ) 
                                ],
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                    onTap: () {
                      activeInvestmentController.loadActiveInvestmentPage();
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4FCF7),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFE8E8EA), // Border color
                                width: 1, // Border width
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Flexible(
                                    flex: 33,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 7,
                                          child: Container()
                                        ),
                                        Flexible(
                                          flex: 93,
                                          child: Icon(
                                            CustomIcons.setting2,
                                            color: const Color(0xFF008037),
                                            size: screenWidth * 0.0790,
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  Flexible(
                                    flex: 38,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Obx(() => 
                                            Text(
                                              myInvestmentsController.actionRequired.value,
                                              style: TextStyle(
                                                fontSize: 34.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF1D192B),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 28,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Action Required',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF71717A),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ) 
                                ],
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                    onTap: () {

                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4FCF7),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFE8E8EA), // Border color
                                width: 1, // Border width
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Flexible(
                                    flex: 33,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 7,
                                          child: Container()
                                        ),
                                        Flexible(
                                          flex: 93,
                                          child: Icon(
                                            CustomIcons.moneySend,
                                            color: const Color(0xFF008037),
                                            size: screenWidth * 0.0790,
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  Flexible(
                                    flex: 38,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '৳',
                                                style: TextStyle(
                                                  fontSize: 34.sp,
                                                  fontFamily: 'Gilroy',
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color(0xFF1D192B),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Obx(() => 
                                                Text(
                                                  myInvestmentsController.readyForCashout.value,
                                                  style: TextStyle(
                                                    fontSize: 34.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(0xFF1D192B),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 28,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Ready for Cashout',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF71717A),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ) 
                                ],
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                    onTap: () {
                      cashOutController.loadCashOut();
                    },
                  )
                ]
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