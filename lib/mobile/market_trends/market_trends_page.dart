import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_dropdown_for_icon.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/market_trends_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class MarketTrendsPage extends StatelessWidget {
  const MarketTrendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MarketTrendsController marketTrendsController = Get.put(MarketTrendsController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PopScope(
            canPop: true,
            onPopInvoked: (_) async{
              Future.delayed(const Duration(milliseconds: 300), () {
                // investmentOpportunityDetailsController.resetVariables();
              });
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: screenHeight * 0.095,
                  floating: true,
          
                  automaticallyImplyLeading: false,
                  leading: null,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: screenWidth * 0.013, right: screenWidth * 0.013, top: screenHeight * 0.020, bottom: screenHeight * 0.020),
                          margin: const EdgeInsets.only(top: 0, left: 0, right: 0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Builder(builder: (context) => Padding(
                                    padding: const EdgeInsets.only(top: 0, left: 0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container()
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: GestureDetector(
                                            child: CircleAvatar(
                                              radius: screenWidth * 0.0520,
                                              backgroundColor: const Color(0xFFF4FCF7),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(top: 0, bottom: screenWidth * 0.003),
                                                  child: Icon(
                                                    CustomIcons.backArrow2,
                                                    size: screenWidth * 0.054,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                              // Scaffold.of(context).openDrawer();
                                              // drawerController.toggleDrawer();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Market Trends',
                                    style: TextStyle(
                                      fontSize: 23.sp,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF1D192B),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ),
                              Expanded(
                                flex: 3,
                                child: CommonDropdownForIcon(
                                  allDropdownValue: marketTrendsController.marketTrendsFilteringList,
                                  dropdownBackgroundColor: const Color.fromARGB(255, 230, 231, 247),
                                  borderRadius: 7,
                                  dropdownWidth: screenWidth * 0.35,
                                  offset: Offset(-((screenWidth * 0.35)/2)-18, -3),
                                  customButton: CircleAvatar(
                                    radius: screenWidth * 0.0520,
                                    backgroundColor: const Color(0xFFF4FCF7),
                                    child: Center(
                                      child: Icon(
                                        CustomIcons.filterSquare,
                                        color: const Color(0xFF292D32),
                                        size: screenWidth * 0.06,
                                      ),
                                    ),
                                  ),
                                  onChanged:  (value) {
                                    // print(value);
                                    marketTrendsController.updateFilterMarketTrends(value!);
                                  },
                                  items: marketTrendsController.marketTrendsFilteringList.map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: SizedBox(
                                        width: 115,
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(item,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                                ) 
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.009,),
                        // const Notifications(),
                        // SizedBox(height: screenHeight * 0.03,),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),

          Obx(() {
            return marketTrendsController.isLoading.value ? const CustomLoader() : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}