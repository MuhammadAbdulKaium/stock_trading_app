import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/payment_proof_controller.dart';

class ConfirmPaymentButton extends StatelessWidget {
  const ConfirmPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentProofController paymentProofController = Get.find<PaymentProofController>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.046296296, right: screenWidth * 0.046296296, bottom: screenHeight * 0.03,),
      child: SizedBox(
        width: double.maxFinite,
        height: screenHeight * 0.05035,
        child: Obx(() { 
          return CommonButton(
            borderRadius: 8,
            backgroundColor: paymentProofController.isPaymentProofSelected.value ? const Color(0xFF008037) : const Color.fromARGB(255, 116, 146, 129),
            onPressed: paymentProofController.isPaymentProofSelected.value 
            ? () {
              paymentProofController.uploadPaymentProof();
            }
            : null,
            child: Text('Confirm Payment',
              style: TextStyle(
                fontSize: 14.75.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }),
      ),
    );
  }
}