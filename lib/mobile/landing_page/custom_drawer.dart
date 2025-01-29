import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/about_us_controller.dart';
import 'package:stock_trading_app/controller/how_munafa_works_controller.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController = Get.find<LandingPageController>();
    final AboutUsController aboutUsController = Get.put(AboutUsController());
    final HowMunafaWorksController howMunafaWorksController = Get.put(HowMunafaWorksController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.zero,
        bottomRight: Radius.zero,
      ),
      child: Drawer(
        // width: 270,
        width: screenWidth * 0.75,
        backgroundColor: Colors.white,
        elevation: 0.0, // Shadow elevation
        child: Obx(() => Column(
          children: <Widget>[
            Flexible(
              flex: 10,
              child: Container()
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: Container()),
                GestureDetector(
                  child: IconButton(
                    iconSize: screenWidth * 0.04253472222,
                    color: const Color(0xFF1D192B),
                    icon: const Icon(
                        CustomIcons.close3,
                      ),
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                  ),
                ),
                Expanded(flex: 2, child: Container()),
                SizedBox(
                  height: screenHeight * 0.08519736842,
                  child: Image.asset(
                    'images/app_icon_inner_page.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.08519736842,
                  ),
                ),
                Expanded(flex: 10, child: Container()),
              ],
            ),
            Flexible(
              flex: 4,
              child: Container()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container()
                ),
                Expanded(
                  flex: 80,
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          landingPageController.changePage(4);
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 244, 245, 247), width: 0.6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.0149671052, bottom: screenHeight * 0.0149671052, left: 0, right: screenWidth * 0.0243055555),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container()
                                ),
                                CircleAvatar(
                                  radius: screenWidth * 0.0510416666,
                                  backgroundColor: Colors.white,
                                  backgroundImage: landingPageController.photo.value.isEmpty ? const AssetImage('images/blank_profile_picture.jpg') : NetworkImage(landingPageController.photo.value) as ImageProvider<Object>,
                                ),
                                // const SizedBox(width: 17,),
                                Expanded(
                                  flex: 4,
                                  child: Container()
                                ),
                                Expanded(
                                  flex: 55,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        landingPageController.userName.value,
                                        style: TextStyle(
                                          fontSize: 13.75.sp,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF344054),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        landingPageController.email.value,
                                        style: TextStyle(
                                          fontSize: 12.83333.sp,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF344054),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container()
                ),
              ],
            ),
            Flexible(
              flex: 8,
              child: Container()
            ),

            Column(
              children: [
                Container(
                  height: screenHeight * 0.05180921052631578,
                  padding: EdgeInsets.only(left: screenWidth * 0.085069444444),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedDrawerPageIndex.value == 1 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,                            // Makes the ListTile more compact
                      contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                      minVerticalPadding: 0,                  // Reduces the minimum vertical padding
                      title: Text('Market Trends',
                        style: TextStyle(
                          color: landingPageController.selectedDrawerPageIndex.value == 1 ? Colors.white : const Color(0xFF344054),
                          fontSize: 13.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        landingPageController.selectedDrawerPageIndex.value = 1;
                        Get.toNamed("/market_trends_page");
                        Future.delayed(const Duration(milliseconds: 350), () {
                          landingPageController.selectedDrawerPageIndex.value = 0;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.05180921052631578,
                  padding: EdgeInsets.only(left: screenWidth * 0.085069444444),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedDrawerPageIndex.value == 2 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,                            // Makes the ListTile more compact
                      contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                      minVerticalPadding: 0,                  // Reduces the minimum vertical padding
                      title: Text('About Us',
                        style: TextStyle(
                          color: landingPageController.selectedDrawerPageIndex.value == 2 ? Colors.white : const Color(0xFF344054),
                          fontSize: 13.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        landingPageController.selectedDrawerPageIndex.value = 2;
                        aboutUsController.loadAboutUsPage();
                        Future.delayed(const Duration(milliseconds: 350), () {
                          landingPageController.selectedDrawerPageIndex.value = 0;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.05180921052631578,
                  padding: EdgeInsets.only(left: screenWidth * 0.085069444444),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedDrawerPageIndex.value == 3 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,                            // Makes the ListTile more compact
                      contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                      minVerticalPadding: 0,                  // Reduces the minimum vertical padding
                      // visualDensity: const VisualDensity(vertical: -4), // Reduces the vertical density
                      title: Text('News & Blogs',
                        style: TextStyle(
                          color: landingPageController.selectedDrawerPageIndex.value == 3 ? Colors.white : const Color(0xFF344054),
                          fontSize: 13.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        landingPageController.selectedDrawerPageIndex.value = 3;
                        Get.toNamed("/news_and_blogs_page");
                        Future.delayed(const Duration(milliseconds: 350), () {
                          landingPageController.selectedDrawerPageIndex.value = 0;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container()
                    ),
                    const Expanded(
                      flex: 80,
                      child: Divider(
                        height: 0.5, // Thickness
                        thickness: 0.5, // Thickness
                        color: Color.fromARGB(255, 229, 232, 238),
                        indent: 0, // Remove leading space
                        endIndent: 0, // Remove trailing space
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container()
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * 0.05180921052631578,
                  padding: EdgeInsets.only(left: screenWidth * 0.085069444444),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedDrawerPageIndex.value == 4 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,                            // Makes the ListTile more compact
                      contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                      minVerticalPadding: 0,                  // Reduces the minimum vertical padding
                      // visualDensity: const VisualDensity(vertical: -4), // Reduces the vertical density
                      title: Text('How Munafa Works',
                        style: TextStyle(
                          color: landingPageController.selectedDrawerPageIndex.value == 4 ? Colors.white : const Color(0xFF344054),
                          fontSize: 13.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        landingPageController.selectedDrawerPageIndex.value = 4;
                        howMunafaWorksController.loadHowMunafaWorksPage();
                        Future.delayed(const Duration(milliseconds: 350), () {
                          landingPageController.selectedDrawerPageIndex.value = 0;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.05180921052631578,
                  padding: EdgeInsets.only(left: screenWidth * 0.085069444444),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedDrawerPageIndex.value == 5 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,                            // Makes the ListTile more compact
                      contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                      minVerticalPadding: 0,                  // Reduces the minimum vertical padding
                      visualDensity: const VisualDensity(vertical: -0), // Reduces the vertical density
                      title: Text('Contact us',
                        style: TextStyle(
                          color: landingPageController.selectedDrawerPageIndex.value == 5 ? Colors.white : const Color(0xFF344054),
                          fontSize: 13.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        landingPageController.selectedDrawerPageIndex.value = 5;
                        Get.toNamed("/contact_us_page");
                        Future.delayed(const Duration(milliseconds: 350), () {
                          landingPageController.selectedDrawerPageIndex.value = 0;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.05180921052631578,
                  padding: EdgeInsets.only(left: screenWidth * 0.085069444444),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedDrawerPageIndex.value == 6 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,                            // Makes the ListTile more compact
                      contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                      minVerticalPadding: 0,                  // Reduces the minimum vertical padding
                      title: Text('Notification',
                        style: TextStyle(
                          color: landingPageController.selectedDrawerPageIndex.value == 6 ? Colors.white : const Color(0xFF344054),
                          fontSize: 13.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        landingPageController.selectedDrawerPageIndex.value = 6;
                        Get.toNamed("/notification_page");
                        Future.delayed(const Duration(milliseconds: 350), () {
                          landingPageController.selectedDrawerPageIndex.value = 0;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container()
                    ),
                    const Expanded(
                      flex: 80,
                      child: Divider(
                        height: 0.5, // Thickness
                        thickness: 0.5, // Thickness
                        color: Color.fromARGB(255, 229, 232, 238),
                        indent: 0, // Remove leading space
                        endIndent: 0, // Remove trailing space
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container()
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * 0.05180921052631578,
                  padding: EdgeInsets.only(left: screenWidth * 0.085069444444, right: screenWidth * 0.036458333333),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bangla',
                        style: TextStyle(
                          color: const Color(0xFF344054),
                          fontSize: 13.75.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Obx(() => Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: landingPageController.isBanglaActive.value,
                            // activeColor: const Color(0xFF5D5FEF),
                            activeTrackColor: const Color(0xFF008037),
                            onChanged: (value) {
                              landingPageController.toggleBanglaActivationState();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              flex: 74,
              child: Container()
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container()
                ),
                const Expanded(
                  flex: 80,
                  child: Divider(
                    height: 0.5, // Thickness
                    thickness: 0.5, // Thickness
                    color: Color.fromARGB(255, 229, 232, 238),
                    indent: 0, // Remove leading space
                    endIndent: 0, // Remove trailing space
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container()
                ),
              ],
            ),
            Container(
              height: screenHeight * 0.05180921052631578,
              padding: EdgeInsets.only(left: screenWidth * 0.085069444444, right: screenWidth * 0.036458333333),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Log out',
                    style: TextStyle(
                      color: const Color(0xFF008037),
                      fontSize: 13.75.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    child: IconButton(
                      iconSize: screenWidth * 0.065624999999,
                      color: const Color(0xFF008037),
                      icon: const Icon(
                          CustomIcons.logOut,
                        ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Scaffold.of(context).closeDrawer();
                        landingPageController.logout();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Container()
            ),
          ],
        ),) // Animation duration
      ), 
    );
  }
}