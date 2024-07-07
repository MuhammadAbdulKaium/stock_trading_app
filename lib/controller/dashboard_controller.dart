import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/pending_investment_sell_in_progress_model.dart';

class DashboardController extends GetxController {
  final selectedTimeframe = ''.obs;
  List<String> availableTimeframeList = ['Lifetime', 'Today'].obs;
  var isLoading = false.obs;

  final totalFunded = 200.obs;
  final totalEarnings = 250.obs;

  final RxList<PendingInvestmentSellInProgressModel> pendingInvestment = <PendingInvestmentSellInProgressModel>[].obs;
  final RxList<PendingInvestmentSellInProgressModel> sellInProgress = <PendingInvestmentSellInProgressModel>[].obs;

  final readyForWithdraw = 200.obs;
  
  Future<void> changeSelectedTimeframe(String value) async {
    isLoading(true);
    try {
      // print(value);
      selectedTimeframe.value = value;
      // print(selectedTimeframe);
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
                  'Incorrect EMAIL or PASSWORD',
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

  void loadCashOut() {
    Get.toNamed("/cash_out");
  }

  @override
  void onInit() {
    selectedTimeframe.value = availableTimeframeList.first;
    pendingInvestment.assignAll([
      PendingInvestmentSellInProgressModel(id: '1', productCategory: 'rice', title: '2 Lot Boro Rice', price: 150),
      PendingInvestmentSellInProgressModel(id: '2', productCategory: 'corn', title: '1 Lot Corn', price: 150)
    ]);

    // sellInProgress.assignAll([
    //   PendingInvestmentSellInProgressModel(id: '1', productCategory: 'corn', title: '1 Lot Corn', price: 150)
    // ]);

    super.onInit();
  }
}