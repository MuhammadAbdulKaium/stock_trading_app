import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/active_investment_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class ActiveInvestmentList extends StatelessWidget {
  const ActiveInvestmentList({super.key});

  @override
  Widget build(BuildContext context) {
    final ActiveInvestmentController activeInvestmentController = Get.put(ActiveInvestmentController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(),
        ),
        Expanded(
          flex: 105,
          child: Obx(() { 
            if (activeInvestmentController.activeInvestmentList.isEmpty) {
              return Center(
                child: Text(
                  'No Active Investment found.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1D192B),
                  ),
                ),
              );
            } else {
              return Column(
                children: activeInvestmentController.activeInvestmentList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var activeInvestment = entry.value;
                  return Card(
                    color: index % 2 == 0 ? const Color(0xFFF4FCF7) : Colors.white,
                    semanticContainer: false,
                    surfaceTintColor: Colors.white,
                    elevation: 2.7,
                    margin: EdgeInsets.only(bottom: screenWidth * 0.050),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE4E4E7), width: 0.3),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenWidth * 0.0325,
                          bottom: screenWidth * 0.0325,
                          // left: screenWidth * 0.0325,
                          // right: screenWidth * 0.0325,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height:  screenHeight * 0.005,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4, child: Container()
                                ),
                                Expanded(
                                  flex: 96,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: screenHeight * 0.034,
                                              backgroundColor: const Color(0xFFF4FCF7),
                                              child: Center(
                                                child: SizedBox(
                                                  height: screenHeight * 0.0382,
                                                  child: decideImageToShow(activeInvestment.productCategory!),
                                                ),
                                              ),
                                            ),
                                            const Spacer(flex: 1),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  activeInvestment.productName!,
                                                  style: TextStyle(
                                                    fontSize: 16.5.sp,
                                                    fontFamily: 'Gilroy',
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xFF1D192B),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(height: screenHeight * 0.0030),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${activeInvestment.conversionPercentage!}%',
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
                                            const Spacer(flex: 10),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenHeight * 0.0102857,
                                          vertical: screenHeight * 0.00214,
                                        ),
                                        margin: EdgeInsets.only(top: screenHeight * 0.0015),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDFFFEB),
                                          borderRadius: BorderRadius.circular(27),
                                        ),
                                        child: Text(
                                          activeInvestment.productStatus!.toUpperCase()[0] +
                                              activeInvestment.productStatus!.substring(1).toLowerCase(),
                                          style: TextStyle(
                                            fontSize: 11.5.sp,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            color: activeInvestment.productStatus!.toLowerCase() == 'active' ? const Color(0xFF008037)
                                                : activeInvestment.productStatus!.toLowerCase() == 'inactive' ? Colors.red
                                                : Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 7, child: Container()
                                ),
                              ],
                            ),
                            SizedBox(height:  screenHeight * 0.01415,),
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
                                            'Total Funded :',
                                            style: TextStyle(
                                              fontSize: 12.15.sp,
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
                                                activeInvestment.totalFunded?.toString() ?? '',
                                                style: TextStyle(
                                                  fontSize: 12.15.sp,
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
                            SizedBox(height:  screenHeight * 0.017,),
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
                                            'Quantity Available :',
                                            style: TextStyle(
                                              fontSize: 12.15.sp,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF1D192B),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${activeInvestment.quantityAvailable?.toString() ?? '0'} MT',
                                                style: TextStyle(
                                                  fontSize: 12.15.sp,
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
                            SizedBox(height:  screenHeight * 0.017,),
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
                                            'Purchase Price (per MT) :',
                                            style: TextStyle(
                                              fontSize: 12.15.sp,
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
                                                activeInvestment.purchasePricePerMT?.toString() ?? '0',
                                                style: TextStyle(
                                                  fontSize: 12.15.sp,
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
                            SizedBox(height:  screenHeight * 0.017,),
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
                                            'Monthly Storage Cost (per MT) :',
                                            style: TextStyle(
                                              fontSize: 12.15.sp,
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
                                                activeInvestment.monthlyStorageCostPerMT?.toString() ?? '0',
                                                style: TextStyle(
                                                  fontSize: 12.15.sp,
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
                            SizedBox(height:  screenHeight * 0.017,),
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
                                            'Current Selling Price :',
                                            style: TextStyle(
                                              fontSize: 12.15.sp,
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
                                                '${activeInvestment.currentSellingPricePerMT?.toString() ?? '0'}/MT',
                                                style: TextStyle(
                                                  fontSize: 12.15.sp,
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
                            SizedBox(height:  screenHeight * 0.017,),
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
                                            'Purchase Date :',
                                            style: TextStyle(
                                              fontSize: 12.15.sp,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF1D192B),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${DateFormat('dd/MM/yy').format(activeInvestment.purchaseDate!)} | ',
                                                style: TextStyle(
                                                  fontSize: 12.15.sp,
                                                  fontFamily: 'Gilroy',
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xFF1D192B),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('hh:mm a').format(activeInvestment.purchaseDate!),
                                                style: TextStyle(
                                                  fontSize: 12.15.sp,
                                                  fontFamily: 'Gilroy',
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xFF71717A),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              )
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
                            SizedBox(height: screenHeight * 0.034,),
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
                                        width: screenWidth * 0.205,
                                        height: screenHeight * 0.0415,
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
                                          onPressed: () {},
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
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          }),
        ),
        Expanded(
          flex: 5,
          child: Container(),
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