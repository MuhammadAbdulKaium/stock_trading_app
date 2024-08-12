import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/app_introduction_slider_controller.dart';
import 'package:flutter/services.dart';

class AppIntroductionSlider extends StatelessWidget {
  const AppIntroductionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final AppIntroductionSliderController appIntroductionSliderController = Get.put(AppIntroductionSliderController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.085069444444, right: screenWidth * 0.085069444444),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 11,
              child: SizedBox(
                // height: 113.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: screenWidth * 0.35704861111,
                          height: screenHeight * 0.0851973684210,
                          child: Image.asset(
                            'images/app_icon_inner_page.png',
                            fit: BoxFit.contain,
                            // width: screenWidth * 0.35704861111,
                            height: screenHeight * 0.0851973684210,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 52,
              child: Obx(() {
                bool isFading = appIntroductionSliderController.isFading.value;
                double opacity = isFading ? 0.0 : 1.0;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 23, // Adjusted flex factor
                      child: Column(
                        children: [
                          // Flexible(
                          //   flex: 1,
                          //   child: Container()
                          // ),
                          Flexible(
                            // flex: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedOpacity(
                                  opacity: opacity,
                                  duration: const Duration(milliseconds: 200),
                                  child: SizedBox(
                                    height: screenHeight * 0.212993421,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          appIntroductionSliderController.shadowImages[appIntroductionSliderController.currentIndex.value],
                                        ),
                                        Image.asset(
                                          appIntroductionSliderController.images[appIntroductionSliderController.currentIndex.value],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Flexible(
                          //   flex: 3,
                          //   child: Container()
                          // ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5, // Adjusted flex factor
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            opacity: opacity,
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              appIntroductionSliderController.titles[appIntroductionSliderController.currentIndex.value],
                              style: TextStyle(
                                fontSize: 26.2.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF1D192B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 23, // Adjusted flex factor
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container()
                          ),
                          Flexible(
                            flex: 35,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  AnimatedOpacity(
                                    opacity: opacity,
                                    duration: const Duration(milliseconds: 200),
                                    child: Text(
                                      appIntroductionSliderController.texts[appIntroductionSliderController.currentIndex.value],
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 15.54533333.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
            Flexible(
              flex: 11,
              child: Container(
                padding: const EdgeInsets.only(top: 5),
                // color: const Color.fromARGB(66, 144, 161, 146),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(appIntroductionSliderController.images.length, (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.009722),
                              width: screenWidth * 0.017499,
                              height: screenWidth * 0.017499,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appIntroductionSliderController.currentIndex.value == index ? const Color(0xFF008037) : const Color(0xFFCCE6D7),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container()
                    ),
                    // const SizedBox(height: 25.8),
                    Flexible(
                      flex: 8,
                      child: SizedBox(
                        width: double.maxFinite,
                        height: screenWidth * 0.106458333333333,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          onPressed: appIntroductionSliderController.next,
                          child: Text('Next',
                            style: TextStyle(
                              fontSize: 14.846666666666666.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}