import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/support_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/support/chat.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SupportController supportController = Get.put(SupportController());
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
                            'Support',
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
                        child: CircleAvatar(
                          radius: screenWidth * 0.0520,
                          backgroundColor: const Color(0xFFF4FCF7),
                          child: SizedBox(
                            height: screenWidth * 0.1040,
                            width: screenWidth * 0.1040,
                            child: IconButton(
                              onPressed: () {
                                // Navigator.pop(context); // Add your onPressed action here
                              },
                              icon: Center(
                                child: Icon(
                                  CustomIcons.call,
                                  size: screenWidth * 0.054,
                                  color: const Color(0xFF008037),
                                ),
                              ),
                              splashRadius: screenWidth * 0.052,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            
                // Content section (with scroll support for keyboard)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
                    child: Container(
                      // height: screenHeight - screenHeight * 0.1225,
                      alignment: Alignment.topCenter,
                      child: const Chat()
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loader
          Obx(() {
            return supportController.isLoading.value
                ? const CustomLoader()
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}