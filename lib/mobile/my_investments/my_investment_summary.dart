import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_trading_app/controller/active_investment_controller.dart';
import 'package:stock_trading_app/controller/cash_out_controller.dart';
import 'package:stock_trading_app/controller/my_investments_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

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
                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4FCF7),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE8E8EA), // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {},
                        child: Column(
                          children: [
                            Flexible(
                              flex: 100,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      flex: 27,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: screenWidth * 0.03, bottom: screenWidth * 0.006),
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
                                      flex: 44,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Obx(() => 
                                              Text(
                                                myInvestmentsController.pendingInvestment.value.toString(),
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
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4FCF7),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE8E8EA), // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          activeInvestmentController.loadActiveInvestmentPage();
                        },
                        child: Column(
                          children: [
                            Flexible(
                              flex: 100,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      flex: 27,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: screenWidth * 0.03, bottom: screenWidth * 0.006),
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
                                      flex: 44,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Obx(() => 
                                              Text(
                                                myInvestmentsController.activeInvestment.value.toString(),
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
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4FCF7),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE8E8EA), // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {},
                        child: Column(
                          children: [
                            Flexible(
                              flex: 100,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      flex: 27,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: screenWidth * 0.03, bottom: screenWidth * 0.006),
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
                                      flex: 44,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Obx(() => 
                                              Text(
                                                myInvestmentsController.actionRequired.value.toString(),
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
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4FCF7),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE8E8EA), // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          cashOutController.loadCashOut();
                        },
                        child: Column(
                          children: [
                            Flexible(
                              flex: 100,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      flex: 28,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: screenWidth * 0.031, bottom: screenWidth * 0.0088),
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
                                      flex: 44,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Obx(() {
                                              double cashoutValue = myInvestmentsController.readyForCashout.value.toDouble();
                                              String cashoutAmount = NumberFormat("#,##0.0").format(cashoutValue);

                                              double dynamicFontSize = 34;
                                              if (cashoutAmount.length > 5) {
                                                dynamicFontSize = 30;
                                              } 
                                              if (cashoutAmount.length > 6) {
                                                dynamicFontSize = 25;
                                              }
                                              if (cashoutAmount.length > 7) {
                                                dynamicFontSize = 23;
                                              }
                                              if (cashoutAmount.length > 8) {
                                                dynamicFontSize = 22;
                                              }
                                              if (cashoutAmount.length > 9) {
                                                dynamicFontSize = 20;
                                              }
                                              if (cashoutAmount.length > 11) {
                                                dynamicFontSize = 18;
                                              }
                                              if (cashoutAmount.length > 12) {
                                                dynamicFontSize = 16;
                                              }

                                              return Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '৳',
                                                    style: TextStyle(
                                                      fontSize: dynamicFontSize.sp,
                                                      fontFamily: 'Gilroy',
                                                      fontWeight: FontWeight.w400,
                                                      color: const Color(0xFF1D192B),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    cashoutAmount,
                                                    style: TextStyle(
                                                      fontSize: dynamicFontSize.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w700,
                                                      color: const Color(0xFF1D192B),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            })
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 28,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
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
                              )
                            )
                          ],
                        ),
                      ),
                    ),
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