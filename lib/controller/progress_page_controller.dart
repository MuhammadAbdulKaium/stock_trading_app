import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';

class ProgressPageController extends GetxController {
  var isLoading = false.obs;
  var progressValue = 52.0.obs;

  var timelineData = <Map<String, String>>[].obs;

  void updateProgress(double value) {
    progressValue.value = value;
  }

  Future<void> loadProgressPage() async {
    isLoading(true);
    try {
      loadTimelineData();
      Get.toNamed("/progress_page");
    } catch (e) {
      Get.dialog(
        CustomAlartDialog(
          begin: 0,
          end: 0,
          alignment: Alignment.bottomCenter,
          duration: 300,
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          horizontalPadding: 0,
          backgroundColor: Colors.red,
          dialogHeader: const SizedBox(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Something went wrong please try again.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.white,
                    fontFamily: 'FontCircularStd',
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
          dialogContent: Container(),
        )
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadTimelineData () async {
    timelineData.addAll([
      {
        'date': 'Friday, May 3, 2024',
        'time': '4:45 PM',
        'event': 'Seed is in Storage',
        'note': 'Check email for Invoice Copy',
      },
      {
        'date': 'Thursday, May 2, 2024',
        'time': '6:45 PM',
        'event': 'Payment Verified',
        'note': 'Check email for Invoice Copy',
      },
      {
        'date': 'Wednesday, May 1, 2024',
        'time': '4:45 PM',
        'event': 'Invoice Sent',
        'note': 'Check email for Invoice Copy',
      },
      {
        'date': 'Friday, May 3, 2024',
        'time': '4:45 PM',
        'event': 'Seed is in Storage',
        'note': 'Check email for Invoice Copy',
      },
      {
        'date': 'Thursday, May 2, 2024',
        'time': '6:45 PM',
        'event': 'Payment Verified',
        'note': 'Check email for Invoice Copy',
      },
      {
        'date': 'Wednesday, May 1, 2024',
        'time': '4:45 PM',
        'event': 'Invoice Sent',
        'note': 'Check email for Invoice Copy',
      },
    ]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}