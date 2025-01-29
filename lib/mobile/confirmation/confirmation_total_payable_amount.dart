import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/confirmation_controller.dart';

class ConfirmationTotalPayableAmount extends StatelessWidget {
  const ConfirmationTotalPayableAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfirmationController confirmationController = Get.put(ConfirmationController());
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Card(
      color: const Color(0xFFF4F4F5), 
      semanticContainer: false,
      surfaceTintColor: Colors.white,
      elevation: 0,
      // margin: EdgeInsets.only(left: screenWidth * 0.0425, right: screenWidth * 0.0425),
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        padding: EdgeInsets.only(top: screenWidth * 0.073, bottom: screenWidth * 0.073),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE4E4E7), width: 0.9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Total Payable Amount: ',
                    style: TextStyle(
                      fontSize: 15.1.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1D192B),
                    ),
                  ),
                  TextSpan(
                    text: '${confirmationController.totalPayableAmount.value.toDouble().toStringAsFixed(2)} BDT',
                    style: TextStyle(
                      fontSize: 15.1.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1D192B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}