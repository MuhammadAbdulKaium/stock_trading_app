import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/home_page_controller.dart';
import 'package:stock_trading_app/controller/investment_opportunity_details_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

// final HomePageController homePageController = Get.put(HomePageController());

class ActiveCropsToBuy extends StatelessWidget {
  const ActiveCropsToBuy({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());
    final InvestmentOpportunityDetailsController investmentOpportunityDetailsController = Get.put(InvestmentOpportunityDetailsController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Text(
                'Active Crops To Buy',
                style: TextStyle(
                  fontSize: 17.25.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D192B),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.0190,),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Obx(() => homePageController.activeCropsToInvest.isEmpty
                ? Center(
                    child: Text(
                      'No item to show',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1D192B),
                      ),
                    ),
                  )
                : Column(
                children: homePageController.activeCropsToInvest.map((activeCrop) => 
                Container(
                  margin: EdgeInsets.only(bottom: screenHeight * 0.0337,),
                  padding: EdgeInsets.only(top: screenHeight * 0.017000, bottom: screenHeight * 0.02500,),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the container
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: -2.5,
                        blurRadius: 8.5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFFE4E4E7), // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: Column(
                    children: [
                      // const SizedBox(height: 13,),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container()
                          ),
                          Expanded(
                            flex: 96,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: screenHeight * 0.034,
                                        backgroundColor: const Color(0xFFF4FCF7),
                                        child: Center(
                                          child: SizedBox(
                                            height: screenHeight * 0.0382,
                                            // child: decideImageToShow(activeCrop.productCategory!),
                                            child: activeCrop.imageUrl!.isNotEmpty && activeCrop.imageUrl != null
                                            ? Image.network(
                                              activeCrop.imageUrl!,
                                              height: screenWidth * 0.07 * 2,  // Adjust based on your layout
                                              fit: BoxFit.cover,
                                            )
                                            : Image.asset(
                                              'images/rice.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(flex: 1,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            activeCrop.name!,
                                            style: TextStyle(
                                              fontSize: 16.5.sp,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF1D192B),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.0030,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                // '${investmentOpportunity.conversionPercentage!}%',
                                                '+5%',
                                                style: TextStyle(
                                                  fontSize: 11.015625.sp,
                                                  fontFamily: 'Gilroy',
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xFF008037),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Icon(
                                                CustomIcons.arrowUp,
                                                color: const Color(0xFF008037),
                                                size: screenHeight * 0.018,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Spacer(flex: 10,),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.0102857, vertical: screenHeight * 0.00214),
                                  margin: EdgeInsets.only(top: screenHeight * 0.0034285),
                                  // color: const Color(0xFFDFFFEB),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDFFFEB),
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  child: Text(
                                    // activeCrop.productStatus!,
                                    (activeCrop.status ?? false) ? 'Active' : 'Inactive',
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                        ],
                      ),
                      SizedBox(height:  screenHeight * 0.015833,),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                          Expanded(
                            flex: 93,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // 'Purchase price (Per MT) :',
                                      'Purchase price (Per ${
                                        activeCrop.lotUnit!.isNotEmpty && activeCrop.lotUnit != null 
                                        ? activeCrop.lotUnit
                                        : 'Unit'
                                      }) :',
                                      style: TextStyle(
                                        fontSize: 12.5.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1D192B),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CustomIcons.currencyTaka,
                                          color: const Color(0xFF1D192B),
                                          size: screenHeight * 0.0155,
                                        ),
                                        Text(
                                          // activeCrop.purchasePrice?.toString() ?? '',
                                          activeCrop.pricePerUnit?.toString() ?? '',
                                          style: TextStyle(
                                            fontSize: 12.5.sp,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF1D192B),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                        ],
                      ),
                      SizedBox(height:  screenHeight * 0.015833,),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                          Expanded(
                            flex: 93,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // 'Selling price (Per MT) :',
                                      'Transport Cost (Per ${
                                        activeCrop.lotUnit!.isNotEmpty && activeCrop.lotUnit != null 
                                        ? activeCrop.lotUnit
                                        : 'Unit'
                                      }) :',
                                      style: TextStyle(
                                        fontSize: 12.5.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1D192B),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CustomIcons.currencyTaka,
                                          color: const Color(0xFF1D192B),
                                          size: screenHeight * 0.0155,
                                        ),
                                        Text(
                                          // activeCrop.sellingPrice?.toString() ?? '',
                                          activeCrop.transportCost?.toString() ?? '',
                                          style: TextStyle(
                                            fontSize: 12.5.sp,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF1D192B),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.015833,),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                          Expanded(
                            flex: 93,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // 'Monthly storage cost (Per MT) :',
                                      'Handling Cost (Per ${
                                        activeCrop.lotUnit!.isNotEmpty && activeCrop.lotUnit != null 
                                        ? activeCrop.lotUnit
                                        : 'Unit'
                                      }) :',
                                      style: TextStyle(
                                        fontSize: 12.5.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1D192B),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CustomIcons.currencyTaka,
                                          color: const Color(0xFF1D192B),
                                          size: screenHeight * 0.0155,
                                        ),
                                        Text(
                                          // activeCrop.monthlyStorageCost?.toString() ?? '',
                                          activeCrop.handlingCost?.toString() ?? '',
                                          style: TextStyle(
                                            fontSize: 12.5.sp,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF1D192B),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.0315,),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                          Expanded(
                            flex: 93,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.190,
                                  height: screenHeight * 0.040,
                                  child: CommonButton(
                                    borderRadius: 8,
                                    backgroundColor: const Color(0xFF008037),
                                    child: Text('Invest',
                                      style: TextStyle(
                                        fontSize: 13.5.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    onPressed: () {
                                      investmentOpportunityDetailsController.loadInvestmentOpportunityDetailsPage(activeCrop);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container()
                          ),
                        ],
                      ),
                    ],
                  ),
                )).toList(),
              ))
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        ),
      ],
    );
  }
}
Widget decideImageToShow(String category) {
  if (category == 'rice') {
    return Image.asset(
      'images/rice.png',
      fit: BoxFit.contain,
    );
  } else if (category == 'corn') {
    return Image.asset(
      'images/corn.png',
      fit: BoxFit.contain,
    );
  } else {
    return Container(); // Return an empty container if no condition matches
  }
}