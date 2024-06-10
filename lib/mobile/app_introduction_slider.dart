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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.only(top: 8),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: 74,
      //           child: Image.asset(
      //             'images/app_icon_inner_page.png',
      //             fit: BoxFit.contain,
      //             height: 74,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35.0, right: 35.0),
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
                          height: 74,
                          child: Image.asset(
                            'images/app_icon_inner_page.png',
                            fit: BoxFit.contain,
                            height: 74,
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
                        // mainAxisAlignment: MainAxisAlignment.end,
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
                                    height: 185,
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
                              style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1D192B),
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
                                      style: const TextStyle(
                                        fontSize: 17.8,
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
                              margin: const EdgeInsets.symmetric(horizontal: 4.0),
                              width: 7.2,
                              height: 7.2,
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
                        height: 43.8,
                        child: CommonButton(
                          borderRadius: 8,
                          backgroundColor: const Color(0xFF008037),
                          onPressed: appIntroductionSliderController.next,
                          child: const Text('Next',
                            style: TextStyle(
                              fontSize: 17,
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

// @override
// void dispose() {
//   // Reset the orientation when the widget is disposed
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//     DeviceOrientation.landscapeLeft,
//     DeviceOrientation.landscapeRight,
//   ]);
//   super.dispose();
// }