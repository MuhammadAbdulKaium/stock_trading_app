import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/dashboard/dashboard_page.dart';
import 'package:stock_trading_app/mobile/home/home_page.dart';
import 'package:stock_trading_app/mobile/landing_page/bottom_navigation_bar.dart';
import 'package:stock_trading_app/mobile/landing_page/custom_drawer.dart';
import 'package:stock_trading_app/mobile/marketplace/marketplace_page.dart';
import 'package:stock_trading_app/mobile/my_investments/my_investments_page.dart';

final LandingPageController landingPageController = Get.put(LandingPageController());
final List<Widget> page = [const HomePage(), const MyInvestmentsPage(), const MarketplacePage(), const DashboardPage()];
final List pageTitle = ['Home', 'My Investments', 'Marketplace', 'Dashboard', 'Profile', 'Market Trends', 'About Us', 'News & Blogs', 'How Munafa Works', 'Contact us', 'Notification'];

class LandingMobile extends StatelessWidget {
  const LandingMobile({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() => PopScope(
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
                  backgroundColor: Colors.white,
                  expandedHeight: 85,
                  floating: true,
          
                  automaticallyImplyLeading: false,
                  leading: null,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5, right: 5, top: 18, bottom: 18),
                          margin: const EdgeInsets.only(top: 0, left: 0, right: 0),
                          decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Builder(builder: (context) => Padding(
                                    padding: const EdgeInsets.only(top: 8, left: 0),
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
                                            child: const SizedBox(
                                              height: 27,
                                              width: 27,
                                              child: Icon(
                                                CustomIcons.menuIcon,
                                                size: 45,
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
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1D192B),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )
                              ),
                              const Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor: Color(0xFFF4FCF7),
                                      // backgroundImage: AssetImage('images/blank_profile_picture.jpg'),
                                      child: Center(
                                        child: Icon(
                                          CustomIcons.notificationIcon,
                                          size: 27.5,
                                          color: Color(0xFF008037),
                                        ),
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
          )),

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
  }
}




// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'landing_mobile',
//             ),
//           ],
//         ),
//       ),