import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
// import 'package:stock_trading_app/controller/profile_controller.dart';
// import 'package:stock_trading_app/controller/contact_us_controller.dart';

class MessageSentFailedDialog extends StatelessWidget {
  const MessageSentFailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController = Get.find<LandingPageController>();
    // final ProfileController profileController = Get.find<ProfileController>();
    // final ProfileController profileController = Get.put(ProfileController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomAlartDialog(
      dialogHeader: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.0204),
        child: Text(
          'Validation Error !',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 19.sp,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D192B),
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      dialogContent: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.0104),
            Text(
              'You need to fill up your personal information first to send a message.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.65.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: const Color(0xFF52525B),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenWidth * 0.135,
                  height: screenHeight * 0.038,
                  child: CommonButton(
                    borderRadius: 8,
                    backgroundColor: const Color(0xFF008037),
                    child: Text('OK',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onPressed: () {
                      Get.back(); // Close the dialog
                      Get.back(); // Close the ContactUsPage route and navigate back
                      landingPageController.profilePageTabController.value = 0;
                      landingPageController.changePage(4);
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.0192),
          ],
        ),
      ),
    );
  }
}