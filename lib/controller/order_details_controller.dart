import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/order_details_model.dart';

class OrderDetailsController extends GetxController with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var orderDetails = OrderDetailsModel().obs;

  late TabController tabController;

  Future<void> loadOrderDetailsPage(String orderId) async {
    isLoading(true);
    try {
      orderDetails.value = OrderDetailsModel(
        id: '1',
        name: 'Aman Rice',
        category: 'rice',
        status: 'active',
        warehouse: 'Kaunia, Rangpur',
        type: 'Premium',
        regionOfOrigin: 'Rajshahi',
        lotSize: 10,
        pricePerUnit: 1000,
        storageConditions: 'Cool, dry place',
        optimalStorageTemperature: '15-20',
        monthlyStoreCost: 100,
        transportCost: 100,
        handlingFees: 20,
      );
      Get.toNamed("/order_details_page");
      // Get.toNamed("/summary");
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
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}