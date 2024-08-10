import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/investment_opportunity_details_controller.dart';
import 'package:stock_trading_app/controller/payment_proof_controller.dart';

class PaymentConfirmationDialog extends StatelessWidget {
  const PaymentConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentProofController paymentProofController = Get.put(PaymentProofController());
    final InvestmentOpportunityDetailsController investmentOpportunityDetailsController = Get.put(InvestmentOpportunityDetailsController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return CustomAlartDialog(
      end: -0.03,
      horizontalPadding: screenWidth * 0.041666,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      closeIcon: Padding(
        padding: EdgeInsets.only(right: screenWidth * 0.03, top: screenWidth * 0.0215),
        child: Icon(
          Icons.close,
          color: const Color(0xFF71717A),
          size: screenWidth * 0.06,
        ),
      ),
      onClose: () {
        investmentOpportunityDetailsController.loadInvestmentOpportunityDetailsPage();
        Future.delayed(const Duration(milliseconds: 300), () {
          paymentProofController.resetVariables();
        });
      },
      dialogHeader: Column(
        children: [
          SizedBox(height: screenHeight * 0.015,),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.089930545),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenWidth * 0.3135416,
                  width: screenWidth * 0.3135416,
                  child: Image.asset('images/success-check-mark.gif')
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.015,),
          Row(
            children: [
              Text(
                'Thank You',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 19.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D192B),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
      dialogContent: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01,),
            Text(
              'Our team will review your payment submission and provide an update shortly.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.0.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: const Color(0xFF1D192B),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: screenHeight * 0.031,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenWidth * 0.171,
                  height: screenHeight * 0.0405,
                  child: CommonButton(
                    borderRadius: 8,
                    backgroundColor: const Color(0xFF008037),
                    child: Text('Ok',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      investmentOpportunityDetailsController.loadInvestmentOpportunityDetailsPage();
                      Future.delayed(const Duration(milliseconds: 300), () {
                        paymentProofController.resetVariables();
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.0192,),
          ],
        ),
      ),
    );
  }
}