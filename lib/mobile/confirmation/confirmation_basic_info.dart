import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/confirmation_controller.dart';
import 'package:stock_trading_app/mobile/confirmation/confirmation_total_payable_amount.dart';

class ConfirmationBasicInfo extends StatelessWidget {
  const ConfirmationBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfirmationController confirmationController = Get.find<ConfirmationController>();
    // final PaymentProofController paymentProofController = Get.put(PaymentProofController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text(confirmationController.investmentDetails.value.name!,
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
                          child: Text('${confirmationController.lotSizeToBuy.value.toString()} ${confirmationController.investmentDetails.value.lotUnit ?? 'Unit'}',
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
                          child: Text('${confirmationController.investmentDetails.value.pricePerUnit.toString()} BDT/${confirmationController.investmentDetails.value.lotUnit ?? 'Unit'}',
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
                          child: Text('Total:',
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
                          child: Text('${confirmationController.totalWithoutAssociatedCost.value.toString()} BDT/${confirmationController.investmentDetails.value.lotUnit ?? 'Unit'}',
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
                          child: Text('Monthly Store Cost:',
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
                          child: Text('${confirmationController.totalMonthlyStoreCost.value.toString()} BDT/${confirmationController.investmentDetails.value.lotUnit ?? 'Unit'}',
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
                          // child: Text('${confirmationController.investmentDetails.value.transportCost!.toString()} per shipment',
                          child: Text('${confirmationController.totalTransportCost.value.toString()} BDT/${confirmationController.investmentDetails.value.lotUnit ?? 'Unit'}',
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
                          child: Text('${confirmationController.totalHandlingFees.value.toString()} BDT/${confirmationController.investmentDetails.value.lotUnit ?? 'Unit'}',
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
                          child: Text('Additional Cost:',
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
                          child: Text('${confirmationController.totalAdditionalCost.value.toString()} BDT/${confirmationController.investmentDetails.value.lotUnit ?? 'Unit'}',
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
                    SizedBox(height: screenHeight * 0.0525,),
                    const ConfirmationTotalPayableAmount(),
                    SizedBox(height: screenHeight * 0.0525,),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(),
              ),
            ],
          ),
          // SizedBox(height: screenHeight * 0.0525,),
          // const ConfirmationTotalPayableAmount(),
          // SizedBox(height: screenHeight * 0.0525,),
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
                          _showBookingConfirmationDialog(context, screenWidth, screenHeight);
                          // if(confirmationInfoFormkey.currentState!.validate()) {
                          //   _showBookingConfirmationDialog(context, screenWidth, screenHeight);
                          // }
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
      ),
    );
  }
}

void _showBookingConfirmationDialog(BuildContext context, double screenWidth, double screenHeight) {
  final ConfirmationController confirmationController = Get.find<ConfirmationController>();

  Get.dialog(
    CustomAlartDialog(
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
        Future.delayed(const Duration(milliseconds: 300), () {
          // Handle any close action here if needed
        });
      },
      dialogHeader: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.0204),
        child: Text(
          'Confirm Purchase',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14.3.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D192B),
          ),
        ),
      ),
      dialogContent: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.0104),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Are you want to Confirm this purchase?',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12.65.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF52525B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenWidth * 0.18,
                  height: screenHeight * 0.038,
                  child: CommonButton(
                    borderRadius: 8,
                    backgroundColor: const Color(0xFF008037),
                    child: Text('Confirm',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onPressed: () {
                      Get.back(); // Close the dialog
                      confirmationController.bookingProduct();
                      // paymentProofController.loadPaymentProofPage();
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.0192),
          ],
        ),
      ),
    ),
  );
}