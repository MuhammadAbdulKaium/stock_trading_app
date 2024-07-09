import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/active_investment_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/Active%20Investment/active_investment_list.dart';

class ActiveInvestmentPage extends StatelessWidget {
  const ActiveInvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ActiveInvestmentController activeInvestmentController = Get.put(ActiveInvestmentController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PopScope(
            canPop: true,
            onPopInvoked: (_) async{
              // if(!landingPageController.canGoBack.value) {
              //   landingPageController.goBack();
              // }
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
                                    'Active Investment',
                                    style: TextStyle(
                                      fontSize: 21.sp,
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
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: screenWidth * 0.0520,
                                      backgroundColor: const Color(0xFFF4FCF7),
                                      // backgroundImage: AssetImage('images/blank_profile_picture.jpg'),
                                      child: Center(
                                        child: Icon(
                                          CustomIcons.filterSquare,
                                          size: screenWidth * 0.065,
                                          color: const Color(0xFF008037),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                          SizedBox(height: screenHeight * 0.02,),
                          const ActiveInvestmentList(),
                          // SizedBox(height: screenHeight * 0.015,),
                        ],
                      ),
                  ),
                ),
              ],
            )
          ),

          Obx(() {
            return activeInvestmentController.isLoading.value ? const CustomLoader() : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}