import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/active_investment_model.dart';

class ActiveInvestmentController extends GetxController {
  var isLoading = false.obs;
  final RxList<ActiveInvestmentModel> activeInvestmentList = <ActiveInvestmentModel>[].obs;

  Future<void> loadActiveInvestmentPage() async {
    isLoading(true);
    try {
      Get.toNamed("/active_investment");
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

  @override
  void onInit() {
    super.onInit();

    activeInvestmentList.assignAll([
      ActiveInvestmentModel(productId: '1', productName: 'Aman Rice', productCategory: 'rice', productStatus: 'active', conversionPercentage: '+5', totalFunded: 1000, quantityAvailable: 20, purchasePricePerMT: 1000, monthlyStorageCostPerMT: 100, currentSellingPricePerMT: 900, purchaseDate: DateTime.now()),
      ActiveInvestmentModel(productId: '2', productName: 'Corn', productCategory: 'corn', productStatus: 'active', conversionPercentage: '+6', totalFunded: 1000, quantityAvailable: 20, purchasePricePerMT: 1000, monthlyStorageCostPerMT: 100, currentSellingPricePerMT: 900, purchaseDate: DateTime.now()),
      ActiveInvestmentModel(productId: '3', productName: 'Aman Rice', productCategory: 'rice', productStatus: 'active', conversionPercentage: '+5', totalFunded: 1000, quantityAvailable: 20, purchasePricePerMT: 1000, monthlyStorageCostPerMT: 100, currentSellingPricePerMT: 900, purchaseDate: DateTime.now()),
    ]);
  }
}