import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

final LandingPageController landingPageController = Get.find<LandingPageController>();
final List<String> drawerItemTitles = ['Market Trends', 'About Us', 'News & Blogs', 'How Munafa Works', 'Contact us', 'Notification', 'Bangla'];

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final LandingPageController landingPageController = Get.find<LandingPageController>();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.zero,
        bottomRight: Radius.zero,
      ),
      child: Drawer(
        // width: 270,
        width: MediaQuery.of(context).size.width * 0.75,
        backgroundColor: Colors.white,
        elevation: 0.0, // Shadow elevation
        // duration: Duration(seconds: 1),
        child: Obx(() => Column(
          // padding: EdgeInsets.zero,
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
                    iconSize: 17.5,
                    color: const Color(0xFF1D192B),
                    icon: const Icon(
                        CustomIcons.close3,
                        // size: 25,
                      ),
                    onPressed: () {
                      // Navigator.pop(context);
                      // landingPageController.toggleSideMenu();
                      // Scaffold.of(context).openDrawer();
                      Scaffold.of(context).closeDrawer();
                    },
                  ),
                ),
                Expanded(flex: 2, child: Container()),
                SizedBox(
                  height: 74,
                  child: Image.asset(
                    'images/app_icon_inner_page.png',
                    fit: BoxFit.contain,
                    height: 74,
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 244, 245, 247), width: 0.6),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, bottom: 13, left: 0, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container()
                          ),
                          const CircleAvatar(
                            radius: 21,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/blank_profile_picture.jpg'),
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
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF344054),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  landingPageController.email.value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF344054),
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
                  height: 45,
                  padding: const EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedPageIndex.value == 5 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    dense: true,                            // Makes the ListTile more compact
                    contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                    title: Text('Market Trends',
                      style: TextStyle(
                        color: landingPageController.selectedPageIndex.value == 5 ? Colors.white : const Color(0xFF344054),
                        fontSize: 15,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      landingPageController.changePage(5);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  height: 45,
                  padding: const EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedPageIndex.value == 6 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    dense: true,                            // Makes the ListTile more compact
                    contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                    title: Text('About Us',
                      style: TextStyle(
                        color: landingPageController.selectedPageIndex.value == 6 ? Colors.white : const Color(0xFF344054),
                        fontSize: 15,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      landingPageController.changePage(6);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  height: 45,
                  padding: const EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedPageIndex.value == 7 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    dense: true,                            // Makes the ListTile more compact
                    contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                    title: Text('News & Blogs',
                      style: TextStyle(
                        color: landingPageController.selectedPageIndex.value == 7? Colors.white : const Color(0xFF344054),
                        fontSize: 15,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      landingPageController.changePage(7);
                      Navigator.pop(context);
                    },
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
                  height: 45,
                  padding: const EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedPageIndex.value == 8 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    dense: true,                            // Makes the ListTile more compact
                    contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                    title: Text('How Munafa Works',
                      style: TextStyle(
                        color: landingPageController.selectedPageIndex.value == 8 ? Colors.white : const Color(0xFF344054),
                        fontSize: 15,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      landingPageController.changePage(8);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  height: 45,
                  padding: const EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedPageIndex.value == 9 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    dense: true,                            // Makes the ListTile more compact
                    contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                    title: Text('Contact us',
                      style: TextStyle(
                        color: landingPageController.selectedPageIndex.value == 9? Colors.white : const Color(0xFF344054),
                        fontSize: 15,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      landingPageController.changePage(9);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  height: 45,
                  padding: const EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    color: landingPageController.selectedPageIndex.value == 10 ? const Color(0xFF008037) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    dense: true,                            // Makes the ListTile more compact
                    contentPadding: EdgeInsets.zero,        // Removes default ListTile padding
                    title: Text('Notification',
                      style: TextStyle(
                        color: landingPageController.selectedPageIndex.value == 10 ? Colors.white : const Color(0xFF344054),
                        fontSize: 15,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      landingPageController.changePage(10);
                      Navigator.pop(context);
                    },
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
                  height: 45,
                  padding: const EdgeInsets.only(left: 35, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bangla',
                        style: TextStyle(
                          color: Color(0xFF344054),
                          fontSize: 15,
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
              height: 45,
              padding: const EdgeInsets.only(left: 35, right: 15),
              // decoration: BoxDecoration(
              //   color: landingPageController.selectedPageIndex.value == 6 ? const Color(0xFF686AF0) : null,
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Log out',
                    style: TextStyle(
                      color: Color(0xFF008037),
                      fontSize: 15,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    child: IconButton(
                      iconSize: 27,
                      color: const Color(0xFF008037),
                      icon: const Icon(
                          CustomIcons.logOut,
                          // size: 25,
                        ),
                      onPressed: () {
                        // Navigator.pop(context);
                        // landingPageController.toggleSideMenu();
                        // Scaffold.of(context).openDrawer();
                        Scaffold.of(context).closeDrawer();
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