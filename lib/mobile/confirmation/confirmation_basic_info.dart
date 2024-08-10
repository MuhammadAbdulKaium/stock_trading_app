import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/confirmation_controller.dart';
import 'package:stock_trading_app/controller/payment_proof_controller.dart';
import 'package:stock_trading_app/mobile/confirmation/confirmation_total_payable_amount.dart';

class ConfirmationBasicInfo extends StatelessWidget {
  const ConfirmationBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfirmationController confirmationController = Get.put(ConfirmationController());
    final PaymentProofController paymentProofController = Get.put(PaymentProofController());
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> confirmationInfoFormkey = GlobalKey<FormState>();
    
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(),
            ),
            Expanded(
              flex: 98,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(confirmationController.confirmingOrderDetails.value.name!,
                        style: TextStyle(
                          fontSize: 21.6.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0325,),
                  Row(
                    children: [
                      Expanded(
                        flex: 40,
                        child: Text('Lot Size:',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 60,
                        child: Text('${confirmationController.confirmingOrderDetails.value.lotSize!.toString()} Metric Ton',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0105,),
                  Row(
                    children: [
                      Expanded(
                        flex: 40,
                        child: Text('Price Per Unit:',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 60,
                        child: Text('${confirmationController.confirmingOrderDetails.value.pricePerUnit!.toString()} BDT/MT',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0441,),
                  Row(
                    children: [
                      Text("Associated Costs",
                        style: TextStyle(
                          fontSize: 15.9.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02,),
                  Row(
                    children: [
                      Expanded(
                        flex: 40,
                        child: Text('Monthly Store cost:',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 60,
                        child: Text('${confirmationController.confirmingOrderDetails.value.monthlyStoreCost!.toString()} BDT/Metric Ton',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0087,),
                  Row(
                    children: [
                      Expanded(
                        flex: 40,
                        child: Text('Transport Cost:',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 60,
                        child: Text('${confirmationController.confirmingOrderDetails.value.transportCost!.toString()} per shipment',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0087,),
                  Row(
                    children: [
                      Expanded(
                        flex: 40,
                        child: Text('Handling Fees:',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 60,
                        child: Text('${confirmationController.confirmingOrderDetails.value.handlingFees!.toString()} BDT/Metric Ton',
                          style: TextStyle(
                            fontSize: 11.95.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D192B),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.0015,),
        ConfirmationTotalPayableAmount(confirmationInfoFormkey: confirmationInfoFormkey,),
        SizedBox(height: screenHeight * 0.044,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Payable Amount',
              style: TextStyle(
                fontSize: 15.80.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1D192B),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height:  screenHeight * 0.0215,),
        Obx(() =>
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: RichText(
              key: ValueKey<int>(confirmationController.totalPayableAmount.value.toInt()),
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '৳',
                    style: TextStyle(
                      fontSize: 44.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF008037),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextSpan(
                    text: confirmationController.totalPayableAmount.value.toString(),
                    style: TextStyle(
                      fontSize: 44.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF008037),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.0525,),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(),
            ),
            Expanded(
              flex: 98,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: screenHeight * 0.05035,
                    child: CommonButton(
                      borderRadius: 8,
                      backgroundColor: const Color(0xFF008037),
                      child: Text('Confirm',
                        style: TextStyle(
                          fontSize: 14.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      onPressed: () {
                        if(confirmationInfoFormkey.currentState!.validate()) {
                          paymentProofController.loadPaymentProofPage();
                          Future.delayed(const Duration(milliseconds: 300), () {
                            confirmationController.resetVariables();
                          });
                        }
                      }
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03,),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(),
            ),
          ],
        )
      ],
    );
  }
}