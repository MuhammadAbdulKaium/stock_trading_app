import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/payment_proof_controller.dart';

class ConfirmPaymentButton extends StatelessWidget {
  const ConfirmPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentProofController paymentProofController = Get.put(PaymentProofController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
      child: SizedBox(
        width: double.maxFinite,
        height: screenHeight * 0.05035,
        child: CommonButton(
          borderRadius: 8,
          backgroundColor: const Color(0xFF008037),
          child: Text('Confirm Payment',
            style: TextStyle(
              fontSize: 14.75.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onPressed: () {
            paymentProofController.uploadFile();
          }
        ),
      ),
    );
  }
}