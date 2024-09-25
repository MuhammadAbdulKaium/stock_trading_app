import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/investment_opportunity_details_controller.dart';
import 'package:stock_trading_app/models/order_details_model.dart';
import 'package:stock_trading_app/models/product_model.dart';

class ConfirmationController extends GetxController {
  final InvestmentOpportunityDetailsController investmentOpportunityDetailsController = Get.find<InvestmentOpportunityDetailsController>();
  var investmentDetails = ProductModel().obs;
  var isLoading = false.obs;
  var confirmingOrderDetails = OrderDetailsModel().obs;

  Rx<num> maximumLot = 0.obs;
  Rx<num> remainingLot = 0.obs;
  Rx<num> totalPayableAmount = 0.0.obs;
  Rx<num> enteredLotNumerToBuy = 0.obs;
  Rx<num> currentBuyingPrice = 0.0.obs;
  final enteredLotNumerToBuyPlaceHolder = ''.obs;
  late TextEditingController enteredLotNumerToBuyTextEditingController;
  RxBool isenteredLotNumerToBuyFieldClicked = false.obs;

  void enteredLotNumerToBuyFieldIncrementButtonOnTap() {
    if(enteredLotNumerToBuy >= 0 && enteredLotNumerToBuy < maximumLot.value && maximumLot.value >= remainingLot.value && remainingLot.value > 0) {
      enteredLotNumerToBuy.value += 1;
      enteredLotNumerToBuyPlaceHolder.value = enteredLotNumerToBuy.value.toString();
      enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
      remainingLot.value -= 1;
      totalPayableAmount.value = enteredLotNumerToBuy.value.toDouble() * investmentDetails.value.pricePerUnit!.toDouble();
    }
  }

  void enteredLotNumerToBuyFieldDecrementButtonOnTap() {
    if(enteredLotNumerToBuy >= 1 && enteredLotNumerToBuy <= maximumLot.value && maximumLot.value > remainingLot.value && remainingLot.value >= 0) {
      enteredLotNumerToBuy.value -= 1;
      enteredLotNumerToBuyPlaceHolder.value = enteredLotNumerToBuy.value.toString();
      enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
      remainingLot.value += 1;
      totalPayableAmount.value = enteredLotNumerToBuy.value.toDouble() * investmentDetails.value.pricePerUnit!.toDouble();
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

  void setEnteredLotNumerToBuy(value) {
    var parsedValue = value.trim().isNotEmpty ? num.tryParse(value) : 0;
    remainingLot.value = maximumLot.value;
    if(validateAmount(value)) {
      enteredLotNumerToBuy.value = parsedValue ?? 0;
      enteredLotNumerToBuyPlaceHolder.value = value.toString();
      remainingLot.value -= parsedValue ?? 0;
      totalPayableAmount.value = enteredLotNumerToBuy.value.toDouble() * investmentDetails.value.pricePerUnit!.toDouble();
    }
  }

  Future<void> loadConfirmationPage() async {
    isLoading(true);
    try {
      investmentDetails = investmentOpportunityDetailsController.investmentOpportunityDetails;
      confirmingOrderDetails.value = OrderDetailsModel(
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
        quantityAvailable: 19,
      );

      remainingLot.value = maximumLot.value = investmentDetails.value.lotSize?.toInt() ?? 0;
      currentBuyingPrice.value = investmentDetails.value.pricePerUnit!.toDouble();

      Get.toNamed("/confirmation_page");
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
    totalPayableAmount.value = 0.0;
    enteredLotNumerToBuy.value = 0;
    remainingLot.value = maximumLot.value = confirmingOrderDetails.value.lotSize!.toInt();
    enteredLotNumerToBuyPlaceHolder.value = '';
    enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
  }

  @override
  void onInit() {
    super.onInit();
    enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
  }

  @override
  void onClose() {
    enteredLotNumerToBuyTextEditingController.dispose();
    super.onClose();
  }
}