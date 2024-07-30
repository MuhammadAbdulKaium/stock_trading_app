import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/booking_page_controller.dart';
import 'package:stock_trading_app/controller/investment_opportunity_details_controller.dart';
import 'package:stock_trading_app/helpers/app_text_styles.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/helpers/decide_image_to_show.dart';
import 'package:stock_trading_app/mobile/investment_opportunity_details/total_payable_amount.dart';

class InvestmentOpportunityBasicInfo extends StatelessWidget {
  const InvestmentOpportunityBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final InvestmentOpportunityDetailsController investmentOpportunityDetailsController = Get.put(InvestmentOpportunityDetailsController());
    final BookingPageController bookingPageController = Get.put(BookingPageController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> buyInfoFormkey = GlobalKey<FormState>();

    // Define breakpoints
    double productImagePosition;
    if (screenHeight >= 896) {
      productImagePosition = screenHeight * 0.37;
    } else if (screenHeight >= 844) {
      productImagePosition = screenHeight * 0.3775;
    } else if (screenHeight >= 778) {
      productImagePosition = screenHeight * 0.365;
    } else {
      productImagePosition = screenHeight * 0.4;
    }

    return Stack(
      children: [
        Column(
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
                                        child: decideImageToShow(investmentOpportunityDetailsController.investmentOpportunityDetails.value.category!),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(flex: 1),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      investmentOpportunityDetailsController.investmentOpportunityDetails.value.name!,
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
                                        investmentOpportunityDetailsController.investmentOpportunityDetails.value.status!.toUpperCase()[0] +
                                            investmentOpportunityDetailsController.investmentOpportunityDetails.value.status!.substring(1).toLowerCase(),
                                        style: TextStyle(
                                          fontSize: 11.5.sp,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w600,
                                          color: investmentOpportunityDetailsController.investmentOpportunityDetails.value.status!.toLowerCase() == 'active' ? const Color(0xFF008037)
                                              : investmentOpportunityDetailsController.investmentOpportunityDetails.value.status!.toLowerCase() == 'inactive' ? Colors.red
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
                            investmentOpportunityDetailsController.investmentOpportunityDetails.value.warehouse!,
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
                            investmentOpportunityDetailsController.investmentOpportunityDetails.value.type!,
                            style: AppTextStyles.cardPropertyNormal,
                          )
                        ],
                      ),
                      SizedBox(height:  screenHeight * 0.014,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Region of Origin :',
                            style: AppTextStyles.cardPropertyBold,
                          ),
                          Text(
                            investmentOpportunityDetailsController.investmentOpportunityDetails.value.regionOfOrigin!,
                            style: AppTextStyles.cardPropertyNormal,
                          )
                        ],
                      ),
                      SizedBox(height:  screenHeight * 0.014,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lot Size :',
                            style: AppTextStyles.cardPropertyBold,
                          ),
                          Text(
                            '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.lotSize.toString()} Metric Ton',
                            style: AppTextStyles.cardPropertyNormal,
                          )
                        ],
                      ),
                      SizedBox(height:  screenHeight * 0.014,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price Per Unit :',
                            style: AppTextStyles.cardPropertyBold,
                          ),
                          Text(
                            '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.pricePerUnit.toString()} BDT/MT',
                            style: AppTextStyles.cardPropertyNormal,
                          )
                        ],
                      ),
                      SizedBox(height:  screenHeight * 0.014,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Storage Conditions :',
                            style: AppTextStyles.cardPropertyBold,
                          ),
                          Text(
                            investmentOpportunityDetailsController.investmentOpportunityDetails.value.storageConditions!,
                            style: AppTextStyles.cardPropertyNormal,
                          )
                        ],
                      ),
                      SizedBox(height:  screenHeight * 0.0315,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.00185,),
                            child: Icon(
                              CustomIcons.thermometer,
                              size: screenWidth * 0.04325,
                              color: const Color(0xFF008037),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02,),
                          Text(
                            'Optimal storage temperature: ',
                            style: TextStyle(
                              fontSize: 11.95.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF008037),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.optimalStorageTemperature!}°C',
                            style: TextStyle(
                              fontSize: 11.95.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF008037),
                              overflow: TextOverflow.ellipsis,
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
            SizedBox(height:  screenHeight * 0.097,),
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
              child: Column(
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
                            SizedBox(height: screenHeight * 0.1525,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Associated Costs',
                                  style: TextStyle(
                                    fontSize: 17.5.sp,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1D192B),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height:  screenHeight * 0.0175,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Monthly Store cost: ',
                                  style: AppTextStyles.cardPropertyBold,
                                ),
                                Text(
                                  '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.monthlyStoreCost!.toString()} BDT /Metric Ton',
                                  style: AppTextStyles.cardPropertyNormal,
                                )
                              ],
                            ),
                            SizedBox(height:  screenHeight * 0.0085,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Transport Cost: ',
                                  style: AppTextStyles.cardPropertyBold,
                                ),
                                Text(
                                  '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.transportCost!.toString()} BDT /Shipment',
                                  style: AppTextStyles.cardPropertyNormal,
                                )
                              ],
                            ),
                            SizedBox(height:  screenHeight * 0.0085,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Handling Fees: ',
                                  style: AppTextStyles.cardPropertyBold,
                                ),
                                Text(
                                  '${investmentOpportunityDetailsController.investmentOpportunityDetails.value.handlingFees!.toString()} BDT /Metric Ton',
                                  style: AppTextStyles.cardPropertyNormal,
                                )
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
                  SizedBox(height:  screenHeight * 0.033,),
                  TotalPayableAmount(buyInfoFormkey: buyInfoFormkey,),
                  SizedBox(height: screenHeight * 0.047,),
                  Column(
                    children: [
                      TabBar(
                        controller: investmentOpportunityDetailsController.tabController,
                        indicatorColor: const Color(0xFF008037),
                        indicatorWeight: 4.0,
                        labelStyle: TextStyle(
                          fontSize: 13.5.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 13.5.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                        tabs: const [
                          Tab(text: "Overview"),
                          Tab(text: "Tab"),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.24, // Adjust height as needed
                        child: TabBarView(
                          controller: investmentOpportunityDetailsController.tabController,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: screenHeight * 0.024,),
                                      Text(
                                        'Investment Highlights',
                                        style: TextStyle(
                                          fontSize: 13.5.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01115,),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: screenHeight * 0.014,),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Market Trends: High demand expected, with prices rising by 10-15% next quarter. Risk Analysis: Low pest and disease susceptibility; watch for trade policy changes. Return on Investment (ROI): Projected at 20% over 6 months, based on market trends.',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 11.5.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(0xFF52525B),
                                                    height: 1.625,
                                                  ),
                                                ),
                                              ],
                                            ),
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
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(),
                                ),
                                const Expanded(
                                  flex: 98,
                                  child: Center(child: Text("Tab Content"))
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                                child: Text('Next',
                                  style: TextStyle(
                                    fontSize: 14.75.sp,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                onPressed: () {
                                  if(buyInfoFormkey.currentState!.validate()) {
                                    bookingPageController.loadBookingPage();
                                    Future.delayed(const Duration(milliseconds: 300), () {
                                      investmentOpportunityDetailsController.resetVariables();
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
              ),
            )
          ],
        ),
        Positioned(
          top: productImagePosition,
          left: screenWidth / 2 - ((screenWidth * 0.52) / 2),
          child: SizedBox(
            height: screenHeight * 0.253289,
            width: screenWidth * 0.5535,
            child: Image.asset(
              'images/rice_bag.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ]
    );
  }
}