import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_trading_app/controller/cash_out_controller.dart';

class WithdrawableBalance extends StatelessWidget {
  const WithdrawableBalance({super.key});

  @override
  Widget build(BuildContext context) {
    // final CashOutController cashOutController = Get.put(CashOutController());
    final CashOutController cashOutController = Get.find<CashOutController>();
    // double screenWidth = MediaQuery.of(context).size.width;
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
            padding: EdgeInsets.only(top: screenHeight * 0.0245, bottom: screenHeight * 0.026),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFE4E4E7), // Border color
                width: 1, // Border width
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Withdrawable Balance',
                  style: TextStyle(
                    fontSize: 11.25.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D192B),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: screenHeight * 0.003,),
                Obx(() {
                  double cashoutValue = cashOutController.withdrawableBalance.value.toDouble();
                  String cashoutAmount = NumberFormat("#,##0.0").format(cashoutValue);

                  double dynamicFontSize = 42;
                  if (cashoutAmount.length > 8) {
                    dynamicFontSize = 40;
                  } 
                  if (cashoutAmount.length > 10) {
                    dynamicFontSize = 38;
                  }
                  if (cashoutAmount.length > 11) {
                    dynamicFontSize = 35;
                  }
                  if (cashoutAmount.length > 12) {
                    dynamicFontSize = 32;
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
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        cashoutAmount,
                        style: TextStyle(
                          fontSize: dynamicFontSize.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                }),
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