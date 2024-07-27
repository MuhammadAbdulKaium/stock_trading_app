import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/marketplace_controller.dart';
import 'package:stock_trading_app/controller/order_details_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

// final MarketplaceController marketplaceController = Get.put(MarketplaceController());

class ProfitableSellings extends StatelessWidget {
  const ProfitableSellings({super.key});

  @override
  Widget build(BuildContext context) {
    final MarketplaceController marketplaceController = Get.put(MarketplaceController());
    final OrderDetailsController orderDetailsController = Get.put(OrderDetailsController());
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
                'Profitable Sellings',
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
              child: Obx(() => Column(
                children: marketplaceController.profitableSellings.map((profitableSell) => 
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
                                            child: decideImageToShow(profitableSell.productCategory!),
                                          ),
                                        ),
                                      ),
                                      const Spacer(flex: 1,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profitableSell.productName!,
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
                                                '${profitableSell.conversionPercentage!}%',
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
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2.5),
                                  margin: const EdgeInsets.only(top: 4),
                                  // color: const Color(0xFFDFFFEB),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDFFFEB),
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  child: Text(
                                    profitableSell.productStatus!,
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
                                      'Purchase price (Per MT) :',
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
                                          profitableSell.purchasePrice?.toString() ?? '',
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
                                      'Selling price (Per MT) :',
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
                                          profitableSell.sellingPrice?.toString() ?? '',
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
                                      'Monthly storage cost (Per MT) :',
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
                                          profitableSell.monthlyStorageCost?.toString() ?? '',
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
                                  width: screenWidth * 0.170,
                                  height: screenHeight * 0.040,
                                  child: CommonButton(
                                    borderRadius: 8,
                                    backgroundColor: const Color(0xFF008037),
                                    child: Text('Sell',
                                      style: TextStyle(
                                        fontSize: 13.5.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    onPressed: () {
                                      orderDetailsController.loadOrderDetailsPage(profitableSell.productId!);
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