import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/confirmation_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/confirmation/confirmation_basic_info.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfirmationController confirmationController = Get.put(ConfirmationController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
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
                Container(
                  padding: EdgeInsets.only(left: screenWidth * 0.013, right: screenWidth * 0.013, top: screenHeight * 0.0525, bottom: screenHeight * 0.020),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
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
                        flex: 15,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            'Confirmation',
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
                        flex: 3,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: screenHeight * 0.0235,),
                        const ConfirmationBasicInfo(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return confirmationController.isLoading.value ? const CustomLoader() : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}