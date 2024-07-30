import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/common_inputfield_with_increment_and_decrement.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/controller/sell_page_controller.dart';
import 'package:stock_trading_app/helpers/app_text_styles.dart';
import 'package:stock_trading_app/helpers/decide_image_to_show.dart';

class SellBasicInfo extends StatelessWidget {
  const SellBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final SellPageController sellPageController = Get.put(SellPageController());
    final LandingPageController landingPageController = Get.find<LandingPageController>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> sellInfoFormkey = GlobalKey<FormState>();

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                                    spreadRadius: 0, // The spread radius of the shadow
                                    blurRadius: 1, // The blur radius of the shadow
                                    offset: const Offset(0, 1), // The offset of the shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: screenHeight * 0.034,
                                backgroundColor: const Color(0xFFF4FCF7),
                                child: Center(
                                  child: SizedBox(
                                    height: screenHeight * 0.0386,
                                    child: decideImageToShow(sellPageController.orderDetails.value.category!),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(flex: 1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sellPageController.orderDetails.value.name!,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1D192B),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0030),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenHeight * 0.0102857,
                                    vertical: screenHeight * 0.00214,
                                  ),
                                  margin: EdgeInsets.only(top: screenHeight * 0.00061),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDFFFEB),
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  child: Text(
                                    sellPageController.orderDetails.value.status!.toUpperCase()[0] +
                                        sellPageController.orderDetails.value.status!.substring(1).toLowerCase(),
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                      color: sellPageController.orderDetails.value.status!.toLowerCase() == 'active' ? const Color(0xFF008037)
                                          : sellPageController.orderDetails.value.status!.toLowerCase() == 'inactive' ? Colors.red
                                          : Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 13),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.0365,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Warehouse :',
                        style: AppTextStyles.cardPropertyBold,
                      ),
                      Text(
                        sellPageController.orderDetails.value.warehouse!,
                        style: AppTextStyles.cardPropertyNormal,
                      )
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type :',
                        style: AppTextStyles.cardPropertyBold,
                      ),
                      Text(
                        sellPageController.orderDetails.value.type!,
                        style: AppTextStyles.cardPropertyNormal,
                      )
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Funded :',
                        style: AppTextStyles.cardPropertyBold,
                      ),
                      Obx(() =>
                        Text(
                          '${sellPageController.orderDetails.value.totalFunded!.toString()} BDT',
                          style: AppTextStyles.cardPropertyNormal,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity Available :',
                        style: AppTextStyles.cardPropertyBold,
                      ),
                      Obx(() =>
                        Text(
                          '${sellPageController.orderDetails.value.quantityAvailable!.toString()} Lot',
                          style: AppTextStyles.cardPropertyNormal,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Purchase Price (per MT) :',
                        style: AppTextStyles.cardPropertyBold,
                      ),
                      Text(
                        '${sellPageController.orderDetails.value.purchasePricePerUnit!.toString()} BDT',
                        style: AppTextStyles.cardPropertyNormal,
                      )
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Purchase Date :',
                        style: AppTextStyles.cardPropertyBold,
                      ),
                      Text(
                        '${DateFormat('dd/MM/yy').format(sellPageController.orderDetails.value.purchaseDate!)} | ${DateFormat('hh:mm a').format(sellPageController.orderDetails.value.purchaseDate!)}',
                        style: AppTextStyles.cardPropertyNormal,
                      )
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Monthly Storage Cost (per MT) :',
                        style: AppTextStyles.cardPropertyBold,
                      ),
                      Obx(() =>
                        Text(
                          '${sellPageController.orderDetails.value.monthlyStoreCost!.truncateToDouble() == sellPageController.orderDetails.value.monthlyStoreCost 
                          ? sellPageController.orderDetails.value.monthlyStoreCost!.toInt().toString() 
                          : sellPageController.orderDetails.value.monthlyStoreCost!.toString()} BDT',
                          style: AppTextStyles.cardPropertyNormal,
                        )
                      )
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.058,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Current Selling Price',
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
                    RichText(
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
                            text: sellPageController.orderDetails.value.currentSellingPrice?.truncateToDouble() == sellPageController.orderDetails.value.currentSellingPrice!
                              ? sellPageController.orderDetails.value.currentSellingPrice?.toInt().toString()
                              : sellPageController.orderDetails.value.currentSellingPrice?.toString(),
                            style: TextStyle(
                              fontSize: 44.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF008037),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextSpan(
                            text: '/MT',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF008037),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:  screenHeight * 0.04,),
                  Row(
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
                              '${sellPageController.orderDetails.value.quantityAvailable! < sellPageController.maximumLot.value 
                              ? sellPageController.orderDetails.value.quantityAvailable!.toString()
                              : sellPageController.maximumLot} Lot',
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
                            key: ValueKey<int>(sellPageController.remainingLot.toInt()),
                            children: [
                              Text(
                                'Remaining: ',
                                style: AppTextStyles.cardPropertyBold1,
                              ),
                              Text(
                                '${sellPageController.remainingLot} Lot',
                                style: AppTextStyles.cardPropertyNormal1,
                              ),
                            ],
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
        SizedBox(height:  screenHeight * 0.0175,),
        Container(
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
                            initialValue: sellPageController.enteredLotNumerToSellPlaceHolder.value,
                            isFieldClicked: sellPageController.isenteredLotNumerToSellFieldClicked.value,
                            incrementButtonOnTap: sellPageController.enteredLotNumerToSellFieldIncrementButtonOnTap,
                            decrementButtonOnTap: sellPageController.enteredLotNumerToSellFieldDecrementButtonOnTap,
                            onTap: () {
                              sellPageController.isenteredLotNumerToSellFieldClicked.value = true;
                            },
                            onEditingComplete: () {
                              sellPageController.isenteredLotNumerToSellFieldClicked.value = false;
                            },
                            onTapOutside: (_) {
                              sellPageController.isenteredLotNumerToSellFieldClicked.value = false;
                            },
                            controller: sellPageController.enteredLotNumerToSellTextEditingController,
                            onChanged: (value) {
                              sellPageController.setEnteredLotNumerToSell(value);
                            },
                            validator: (value) {
                              final regex = RegExp(r'^\d*\.?\d*$');
                              final amount = value.trim().isNotEmpty ? num.tryParse(value) : 0;
                    
                              sellPageController.setEnteredLotNumerToSell;
                    
                              if (value.trim().isEmpty) {
                                return 'No. of Unit cannot be empty.';
                              } else if (amount == null || amount <= 0) {
                                return 'Enter a No. of Unit.';
                              } else if (!regex.hasMatch(value.trim())) {
                                return 'Enter a valid No. of Unit.';
                              } else if (sellPageController.maximumLot.value < amount) {
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
                              key: ValueKey<int>(sellPageController.totalReceiveableAmount.toInt()),
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total Receiveable Amount: ',
                                    style: TextStyle(
                                      fontSize: 15.1.sp,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF1D192B),
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${sellPageController.totalReceiveableAmount} BDT',
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
                      ],
                    ),
                  )
                ),
                SizedBox(height:  screenHeight * 0.0155,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 98,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Associated Selling Costs',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1D192B),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height:  screenHeight * 0.017,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transport Cost: ',
                                style: AppTextStyles.cardPropertyBold,
                              ),
                              Text(
                                '${sellPageController.orderDetails.value.transportCost!.toString()} BDT /Shipment',
                                style: AppTextStyles.cardPropertyNormal,
                              )
                            ],
                          ),
                          SizedBox(height:  screenHeight * 0.0095,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Handling Fees: ',
                                style: AppTextStyles.cardPropertyBold,
                              ),
                              Text(
                                '${sellPageController.orderDetails.value.handlingFees!.toString()} BDT /Metric Ton',
                                style: AppTextStyles.cardPropertyNormal,
                              )
                            ],
                          ),
                          SizedBox(height:  screenHeight * 0.09,),
                          SizedBox(
                            width: double.maxFinite,
                            height: screenHeight * 0.05025,
                            child: CommonButton(
                              borderRadius: 8,
                              backgroundColor: const Color(0xFF008037),
                              child: Text('Sell',
                                style: TextStyle(
                                  fontSize: 14.75.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              onPressed: () {
                                if(sellInfoFormkey.currentState!.validate()) {
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
                                        Future.delayed(const Duration(milliseconds: 300), 
                                          () {
                                            // signInAndSignUpController.toggleSignInSignUp();
                                            // signInAndSignUpController.onClose();
                                          }
                                        );
                                      },
                                      dialogContent: Padding(
                                        padding: const EdgeInsets.only(left: 18, right: 18),
                                        child: Column(
                                          children: [
                                            SizedBox(height: screenHeight * 0.005,),
                                            Text(
                                              'Confirm your Sell Request. Our team will start the selling process very shortly. Once the Selling is complete, your money will be available for withdraw.',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 12.65.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF52525B),
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(height: screenHeight * 0.0242,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth * 0.19,
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
                                                      Get.back();
                                                      
                                                      landingPageController.changePage(3);
                                                      Get.offAllNamed('/landing_mobile');
                                                      
                                                      // landingPageController.bottomNavigationPageIndex.value = 3;
                                                      // Get.offAllNamed('/landing_mobile');
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: screenHeight * 0.0192,),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // barrierDismissible: false,
                                  );
                                }
                              }
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.0549,),
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
        ),
      ],
    );
  }
}