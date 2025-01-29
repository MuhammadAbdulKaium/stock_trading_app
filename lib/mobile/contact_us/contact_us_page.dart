import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/contact_us_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/contact_us/message_text_field.dart';
import 'package:stock_trading_app/mobile/contact_us/request_type_dropdown.dart';
import 'package:stock_trading_app/mobile/contact_us/send_button.dart';
import 'package:stock_trading_app/mobile/contact_us/support_button.dart';
import 'package:stock_trading_app/mobile/contact_us/upload_your_file.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactUsController contactUsController = Get.put(ContactUsController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          PopScope(
            canPop: true,
            onPopInvoked: (_) async{
              // Future.delayed(const Duration(milliseconds: 300), () {
              //   confirmationController.resetVariables();
              // });
            },
            child: Column(
              children: [
                // AppBar section
                Container(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.013,
                    right: screenWidth * 0.013,
                    top: screenHeight * 0.0525,
                    bottom: screenHeight * 0.020,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: screenWidth * 0.0520,
                          backgroundColor: const Color(0xFFF4FCF7),
                          child: SizedBox(
                            height: screenWidth * 0.1040,
                            width: screenWidth * 0.1040,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Center(
                                child: Icon(
                                  CustomIcons.backArrow2,
                                  size: screenWidth * 0.054,
                                  color: Colors.black,
                                ),
                              ),
                              splashRadius: screenWidth * 0.052,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 23.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1D192B),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(), // Empty space
                      ),
                    ],
                  ),
                ),
            
                // Content section (with scroll support for keyboard)
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
                      child: Container(
                        height: screenHeight - screenHeight * 0.1225,
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: screenHeight * 0.028),
                                const RequestTypeDropdown(),
                                SizedBox(height: screenHeight * 0.038),
                                const MessageTextField(),
                                SizedBox(height: screenHeight * 0.038),
                                const UploadYourFile(),
                              ],
                            ),
                            // SizedBox(height: screenHeight * 0.038),
                            Column(
                              children: [
                                const SupportButton(),
                                SizedBox(height: screenHeight * 0.04),
                                const SendButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loader
          Obx(() {
            return contactUsController.isLoading.value
                ? const CustomLoader()
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
