import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/booking_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/booking/booking_basic_info.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingPageController bookingPageController = Get.put(BookingPageController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF4FCF7),
      body: Stack(
        children: [
          PopScope(
            canPop: true,
            onPopInvoked: (_) async{
              // Future.delayed(const Duration(milliseconds: 300), () {sellPageController.resetVariables();});
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: const Color(0xFFF4FCF7),
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
                            color: Color(0xFFF4FCF7),
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
                                              backgroundColor: Colors.white,
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
                                    'Booking',
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
                                child: Container(),
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
                          SizedBox(height: screenHeight * 0.0235,),
                          const BookingBasicInfo(),
                        ],
                      ),
                  ),
                ),
              ],
            )
          ),

          Obx(() {
            return bookingPageController.isLoading.value ? const CustomLoader() : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}