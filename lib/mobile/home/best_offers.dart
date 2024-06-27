import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/home_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

final HomePageController homePageController = Get.put(HomePageController());

class BestOffers extends StatelessWidget {
  const BestOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            const Expanded(
              flex: 100,
              child: Text(
                'Best Offers',
                style: TextStyle(
                  fontSize: 18.5,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1D192B),
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
        const SizedBox(height: 18,),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Obx(() => Column(
                children: homePageController.bestOffers.map((bestOffer) => 
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  padding: const EdgeInsets.only(top: 13, bottom: 20),
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
                                        radius: 29,
                                        backgroundColor: const Color(0xFFF4FCF7),
                                        child: Center(
                                          child: SizedBox(
                                            height: 33,
                                            // width: 32,
                                            child: decideImageToShow(bestOffer.productCategory!),
                                          ),
                                        ),
                                      ),
                                      const Spacer(flex: 1,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bestOffer.productName!,
                                            style: const TextStyle(
                                              fontSize: 17.6,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF1D192B),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 3.5,),
                                          Row(
                                            children: [
                                              Text(
                                                '${bestOffer.conversionPercentage!}%',
                                                style: const TextStyle(
                                                  fontSize: 11.75,
                                                  fontFamily: 'Gilroy',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF008037),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const Icon(
                                                CustomIcons.arrowUp,
                                                color: Color(0xFF008037),
                                                size: 14.1,
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
                                    bestOffer.productStatus!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF008037),
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
                      const SizedBox(height: 15,),
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
                                    const Text(
                                      'Purchase price (Per MT) :',
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1D192B),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          CustomIcons.currencyTaka,
                                          color: Color(0xFF1D192B),
                                          size: 14.1,
                                        ),
                                        Text(
                                          bestOffer.purchasePrice?.toString() ?? '',
                                          style: const TextStyle(
                                            fontSize: 13.5,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF1D192B),
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
                      const SizedBox(height: 15,),
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
                                    const Text(
                                      'Selling price (Per MT) :',
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1D192B),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          CustomIcons.currencyTaka,
                                          color: Color(0xFF1D192B),
                                          size: 14.1,
                                        ),
                                        Text(
                                          bestOffer.sellingPrice?.toString() ?? '',
                                          style: const TextStyle(
                                            fontSize: 13.5,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF1D192B),
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
                      const SizedBox(height: 15,),
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
                                    const Text(
                                      'Monthly storage cost (Per MT) :',
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1D192B),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          CustomIcons.currencyTaka,
                                          color: Color(0xFF1D192B),
                                          size: 14.1,
                                        ),
                                        Text(
                                          bestOffer.monthlyStorageCost?.toString() ?? '',
                                          style: const TextStyle(
                                            fontSize: 13.5,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF1D192B),
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
                      const SizedBox(height: 25,),
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
                                  width: 78,
                                  height: 35,
                                  child: CommonButton(
                                    borderRadius: 8,
                                    backgroundColor: const Color(0xFF008037),
                                    child: const Text('Invest',
                                      style: TextStyle(
                                        fontSize: 15,
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