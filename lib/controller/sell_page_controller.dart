import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/order_details_model.dart';

class SellPageController extends GetxController {
  var isLoading = false.obs;
  var orderDetails = OrderDetailsModel().obs;
  Rx<num> maximumLot = 0.obs;
  Rx<num> remainingLot = 0.obs;
  Rx<num> totalReceiveableAmount = 0.0.obs;
  Rx<num> enteredLotNumerToSell = 0.obs;
  Rx<num> currentSellingPrice = 0.0.obs;
  final enteredLotNumerToSellPlaceHolder = ''.obs;
  late TextEditingController enteredLotNumerToSellTextEditingController;
  RxBool isenteredLotNumerToSellFieldClicked = false.obs;

  void enteredLotNumerToSellFieldIncrementButtonOnTap() {
    if(enteredLotNumerToSell >= 0 && enteredLotNumerToSell < maximumLot.value && maximumLot.value >= remainingLot.value && remainingLot.value > 0) {
      enteredLotNumerToSell.value += 1;
      enteredLotNumerToSellPlaceHolder.value = enteredLotNumerToSell.value.toString();
      // print(enteredLotNumerToSellPlaceHolder);
      enteredLotNumerToSellTextEditingController = TextEditingController(text: enteredLotNumerToSellPlaceHolder.value.toString());
      remainingLot.value -= 1;
      totalReceiveableAmount.value = enteredLotNumerToSell.value.toDouble() * orderDetails.value.currentSellingPrice!.toDouble();

      // print(enteredLotNumerToSell.value);
    }
  }

  void enteredLotNumerToSellFieldDecrementButtonOnTap() {
    if(enteredLotNumerToSell >= 1 && enteredLotNumerToSell <= maximumLot.value && maximumLot.value > remainingLot.value && remainingLot.value >= 0) {
      enteredLotNumerToSell.value -= 1;
      enteredLotNumerToSellPlaceHolder.value = enteredLotNumerToSell.value.toString();
      enteredLotNumerToSellTextEditingController = TextEditingController(text: enteredLotNumerToSellPlaceHolder.value.toString());
      remainingLot.value += 1;
      totalReceiveableAmount.value = enteredLotNumerToSell.value.toDouble() * orderDetails.value.currentSellingPrice!.toDouble();
    }
  }

  bool validateAmount(String value) {
    final regex = RegExp(r'^\d*\.?\d*$');   // Regular expression to match numbers with at most one decimal point
    final amount = value.trim().isNotEmpty ? num.tryParse(value) : 0;           // Check if value is a valid number (either int or double)

    if (value.trim().isEmpty) {
      return false;
    } else if (amount == null || amount < 0) {
      return false;
    } else if (!regex.hasMatch(value.trim())) {
      return false;
    } else if (maximumLot.value < amount) {
      return false;
    }

    return true;
  }

  void setEnteredLotNumerToSell(value) {
    var parsedValue = value.trim().isNotEmpty ? num.tryParse(value) : 0;
    remainingLot.value = maximumLot.value;
    if(validateAmount(value)) {
      enteredLotNumerToSell.value = parsedValue ?? 0;
      enteredLotNumerToSellPlaceHolder.value = value.toString();
      remainingLot.value -= parsedValue ?? 0;
      totalReceiveableAmount.value = enteredLotNumerToSell.value.toDouble() * orderDetails.value.currentSellingPrice!.toDouble();
    }
  }

  Future<void> loadSellPage() async {
    isLoading(true);
    try {
      orderDetails.value = OrderDetailsModel(
        id: '1',
        name: 'Aman Rice',
        category: 'rice',
        status: 'active',
        warehouse: 'Kaunia, Rangpur',
        type: 'Premium Aman',
        totalFunded: 20000,
        quantityAvailable: 19,
        purchasePricePerUnit: 1000,
        purchaseDate: DateTime.now(),
        monthlyStoreCost: 100,
        transportCost: 100,
        handlingFees: 20,
        currentSellingPrice: 2000,
      );

      remainingLot.value = maximumLot.value = orderDetails.value.quantityAvailable!.toInt();
      currentSellingPrice.value = orderDetails.value.currentSellingPrice!.toDouble();

      Get.toNamed("/sell_page");
    } catch (e) {
      // throw Exception('Error: $e');
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

  void resetVariables() {
    totalReceiveableAmount.value = 0.0;
    enteredLotNumerToSell.value = 0;
    enteredLotNumerToSellPlaceHolder.value = '';
    enteredLotNumerToSellTextEditingController = TextEditingController(text: enteredLotNumerToSellPlaceHolder.value.toString());
  }

  @override
  void onInit() {
    super.onInit();
    enteredLotNumerToSellTextEditingController = TextEditingController(text: enteredLotNumerToSellPlaceHolder.value.toString());
  }

  @override
  void onClose() {
    enteredLotNumerToSellTextEditingController.dispose();
    super.onClose();
  }
}