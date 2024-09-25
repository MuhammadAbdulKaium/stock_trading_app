import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/controller/notification_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/dashboard/dashboard_page.dart';
import 'package:stock_trading_app/mobile/home/home_page.dart';
import 'package:stock_trading_app/mobile/landing_page/bottom_navigation_bar.dart';
import 'package:stock_trading_app/mobile/landing_page/custom_drawer.dart';
import 'package:stock_trading_app/mobile/marketplace/marketplace_page.dart';
import 'package:stock_trading_app/mobile/my_investments/my_investments_page.dart';
import 'package:stock_trading_app/mobile/profile/profile_page.dart';

final LandingPageController landingPageController = Get.put(LandingPageController(), permanent: true);
final List<Widget> page = [const HomePage(), const MyInvestmentsPage(), const MarketplacePage(), const DashboardPage(), const ProfilePage()];
final List pageTitle = ['Home', 'My Investments', 'Marketplace', 'Dashboard', 'My Account']; //, 'Market Trends', 'About Us', 'News & Blogs', 'How Munafa Works', 'Contact us', 'Notification', 'Cash Out'
final List<Color> statusBarColors = [Colors.white, Colors.white, Colors.white, const Color(0xFFF4FCF7), Colors.white]; //, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white,

class LandingMobile extends StatelessWidget {
  const LandingMobile({super.key});
  
  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.put(NotificationController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Obx(() { 
      return Scaffold(
        backgroundColor: statusBarColors[landingPageController.selectedPageIndex.value],
        body: Stack(
          children: [
            PopScope(
              canPop: landingPageController.canGoBack.value,
              onPopInvoked: (_) async{
                if(!landingPageController.canGoBack.value) {
                  landingPageController.goBack();
                }
              },
              child: CustomScrollView(
                controller: landingPageController.scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: statusBarColors[landingPageController.selectedPageIndex.value],
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
                            decoration: BoxDecoration(
                              color: statusBarColors[landingPageController.selectedPageIndex.value],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    padding: EdgeInsets.only(top: screenWidth * 0.0155),
                                                    child: Icon(
                                                      CustomIcons.menuIcon,
                                                      size: screenWidth * 0.105,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Scaffold.of(context).openDrawer();
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
                                    child: Obx(() => Text(
                                        pageTitle.length > landingPageController.selectedPageIndex.value ? pageTitle[landingPageController.selectedPageIndex.value] : '',
                                        style: TextStyle(
                                          fontSize: 21.sp,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF1D192B),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  )
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed("/notification_page");
                                        },
                                        child: Stack(
                                          clipBehavior: Clip.none, // Allows the badge to overflow outside the CircleAvatar
                                          children: [
                                            CircleAvatar(
                                              radius: screenWidth * 0.0520,
                                              backgroundColor: statusBarColors[landingPageController.selectedPageIndex.value] == Colors.white ? const Color(0xFFF4FCF7) : Colors.white,
                                              child: Center(
                                                child: Icon(
                                                  CustomIcons.notificationIcon,
                                                  size: screenWidth * 0.065,
                                                  color: const Color(0xFF008037),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 2,  // Adjust the position of the badge
                                              right: 5,  // Adjust the position of the badge
                                              child: Obx(() {
                                                int notificationCount = notificationController.notifications.length;
                                                if (notificationCount > 0) {
                                                  return Container(
                                                    padding: const EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    constraints: const BoxConstraints(
                                                      // minWidth: 16,
                                                      // minHeight: 16,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                      child: Center(
                                                        child: Text(
                                                          notificationCount > 9 ? '9+' : '$notificationCount',
                                                          style: TextStyle(
                                                            fontSize: 9.02.sp,
                                                            // fontFamily: 'Gilroy',
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.white,
                                                            height: 1.05,
                                                            // overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return const SizedBox(); // No badge if count is 0
                                              }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
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
                        child: page.length > landingPageController.selectedPageIndex.value ? page[landingPageController.selectedPageIndex.value] : Container(),
                    ),
                  ),
                ],
              ),
            ),

            Obx(() {
              return landingPageController.isLoading.value ? const CustomLoader() : const SizedBox.shrink();
            }),
          ],
        ),

        drawer: Stack(
          children: [
            const CustomDrawer(),
            Obx(() => Visibility(
              visible: landingPageController.isLoading.value,
              child: const CustomLoader(), 
            )),
          ],
        ),

        bottomNavigationBar: const CustomBottomNavigationBar(),
      );
    });
  }
}