import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_inputfield_with_increment_and_decrement.dart';
import 'package:stock_trading_app/controller/investment_opportunity_details_controller.dart';
import 'package:stock_trading_app/helpers/app_text_styles.dart';

class TotalPayableAmount extends StatelessWidget {
  final GlobalKey<FormState> sellInfoFormkey;

  const TotalPayableAmount({super.key, required this.sellInfoFormkey});

  @override
  Widget build(BuildContext context) {
    final InvestmentOpportunityDetailsController investmentOpportunityDetailsController = Get.put(InvestmentOpportunityDetailsController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenWidth * 0.0631944),
          topRight: Radius.circular(screenWidth * 0.0631944),
          bottomLeft: Radius.circular(screenWidth * 0.0631944),
          bottomRight: Radius.circular(screenWidth * 0.0631944),
        ),
      ),
      child: Form(
        key: sellInfoFormkey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
                Expanded(
                  flex: 98,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Maximum: ',
                            style: AppTextStyles.cardPropertyBold1,
                          ),
                          Obx(() =>
                            Text(
                              '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.lotSize! < investmentOpportunityDetailsController.maximumLot.value 
                              ? investmentOpportunityDetailsController.investmentOpportunityDetails.value.lotSize!.toString()
                              : investmentOpportunityDetailsController.maximumLot} Lot',
                              style: AppTextStyles.cardPropertyNormal1,
                            )
                          )
                        ],
                      ),
                      Obx(
                        () => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(opacity: animation, child: child);
                          },
                          child: Row(
                            key: ValueKey<int>(investmentOpportunityDetailsController.remainingLot.toInt()),
                            children: [
                              Text(
                                'Remaining: ',
                                style: AppTextStyles.cardPropertyBold1,
                              ),
                              Text(
                                '${investmentOpportunityDetailsController.remainingLot} Lot',
                                style: AppTextStyles.cardPropertyNormal1,
                              ),
                            ],
                          ),
                        ),
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
            SizedBox(height:  screenHeight * 0.0115,),
            Card(
              color: const Color(0xFFF4F4F5), 
              semanticContainer: false,
              surfaceTintColor: Colors.white,
              elevation: 0,
              margin: EdgeInsets.all(screenWidth * 0.0425,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Container(
                padding: EdgeInsets.only(top: screenWidth * 0.08749999999, bottom: screenWidth * 0.073, left: screenWidth * 0.08749999999, right: screenWidth * 0.08749999999),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE4E4E7), width: 0.9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => 
                      CommonInputFieldWithIncrementAndDecrement(
                        backgroundColor: const Color(0xFFF4FCF7),
                        initialValue: investmentOpportunityDetailsController.enteredLotNumerToSellPlaceHolder.value,
                        isFieldClicked: investmentOpportunityDetailsController.isenteredLotNumerToSellFieldClicked.value,
                        incrementButtonOnTap: investmentOpportunityDetailsController.enteredLotNumerToSellFieldIncrementButtonOnTap,
                        decrementButtonOnTap: investmentOpportunityDetailsController.enteredLotNumerToSellFieldDecrementButtonOnTap,
                        onTap: () {
                          investmentOpportunityDetailsController.isenteredLotNumerToSellFieldClicked.value = true;
                        },
                        onEditingComplete: () {
                          investmentOpportunityDetailsController.isenteredLotNumerToSellFieldClicked.value = false;
                        },
                        onTapOutside: (_) {
                          investmentOpportunityDetailsController.isenteredLotNumerToSellFieldClicked.value = false;
                        },
                        controller: investmentOpportunityDetailsController.enteredLotNumerToSellTextEditingController,
                        onChanged: (value) {
                          investmentOpportunityDetailsController.setEnteredLotNumerToSell(value);
                        },
                        validator: (value) {
                          final regex = RegExp(r'^\d*\.?\d*$');
                          final amount = value.trim().isNotEmpty ? num.tryParse(value) : 0;
                
                          investmentOpportunityDetailsController.setEnteredLotNumerToSell;
                
                          if (value.trim().isEmpty) {
                            return 'No. of Unit cannot be empty.';
                          } else if (amount == null || amount <= 0) {
                            return 'Enter a No. of Unit.';
                          } else if (!regex.hasMatch(value.trim())) {
                            return 'Enter a valid No. of Unit.';
                          } else if (investmentOpportunityDetailsController.maximumLot.value < amount) {
                            return 'Insufficient Unit.';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height:  screenHeight * 0.0218,),
                    Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                        child: RichText(
                          key: ValueKey<int>(investmentOpportunityDetailsController.totalPayableAmount.toInt()),
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
                                text: '${investmentOpportunityDetailsController.totalPayableAmount} BDT',
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
                      ),
                    ),
                    // RichText(
                    //   textAlign: TextAlign.center,
                    //   text: TextSpan(

                    //     children: [
                    //       TextSpan(
                    //         text: 'Total Payable Amount : ',
                    //         style: TextStyle(
                    //           fontSize: 15.1.sp,
                    //           fontFamily: 'Gilroy',
                    //           fontWeight: FontWeight.w600,
                    //           color: const Color(0xFF1D192B),
                    //           // overflow: TextOverflow.ellipsis,
                    //         ),
                    //       ),
                    //       WidgetSpan(
                    //         alignment: PlaceholderAlignment.baseline,
                    //         baseline: TextBaseline.alphabetic,
                    //         child: Obx(
                    //           () => AnimatedSwitcher(
                    //             duration: const Duration(milliseconds: 300),
                    //             child: Text(
                    //               '${investmentOpportunityDetailsController.totalPayableAmount} BDT',
                    //               key: ValueKey<int>(investmentOpportunityDetailsController.totalPayableAmount.toInt()),
                    //               style: TextStyle(
                    //                 fontSize: 15.1.sp,
                    //                 fontFamily: 'Gilroy',
                    //                 fontWeight: FontWeight.w400,
                    //                 color: const Color(0xFF1D192B),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            ),
            SizedBox(height:  screenHeight * 0.0115,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
                Expanded(
                  flex: 98,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Additional Cost : ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.transportCost!.toString()} BDT',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}