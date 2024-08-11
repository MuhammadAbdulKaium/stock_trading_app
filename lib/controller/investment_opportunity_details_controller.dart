import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/models/order_details_model.dart';

class InvestmentOpportunityDetailsController extends GetxController with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var investmentOpportunityDetails = OrderDetailsModel().obs;

  late TabController tabController;

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
      // print(enteredLotNumerToBuyPlaceHolder);
      enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
      remainingLot.value -= 1;
      totalPayableAmount.value = enteredLotNumerToBuy.value.toDouble() * investmentOpportunityDetails.value.pricePerUnit!.toDouble();

      // print(enteredLotNumerToBuy.value);
    }
  }

  void enteredLotNumerToBuyFieldDecrementButtonOnTap() {
    if(enteredLotNumerToBuy >= 1 && enteredLotNumerToBuy <= maximumLot.value && maximumLot.value > remainingLot.value && remainingLot.value >= 0) {
      enteredLotNumerToBuy.value -= 1;
      enteredLotNumerToBuyPlaceHolder.value = enteredLotNumerToBuy.value.toString();
      enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
      remainingLot.value += 1;
      totalPayableAmount.value = enteredLotNumerToBuy.value.toDouble() * investmentOpportunityDetails.value.pricePerUnit!.toDouble();
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
      totalPayableAmount.value = enteredLotNumerToBuy.value.toDouble() * investmentOpportunityDetails.value.pricePerUnit!.toDouble();
    }
  }

  Future<void> loadInvestmentOpportunityDetailsPage() async {
    isLoading(true);
    try {
      investmentOpportunityDetails.value = OrderDetailsModel(
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

      remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
      currentBuyingPrice.value = investmentOpportunityDetails.value.pricePerUnit!.toDouble();

      // Get.toNamed("/investment_opportunity_details_page");
      Get.offNamedUntil(
        "/investment_opportunity_details_page",
        ModalRoute.withName('/landing_mobile'),
      );
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
    remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
    enteredLotNumerToBuyPlaceHolder.value = '';
    enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    enteredLotNumerToBuyTextEditingController = TextEditingController(text: enteredLotNumerToBuyPlaceHolder.value.toString());
  }

  @override
  void onClose() {
    tabController.dispose();
    enteredLotNumerToBuyTextEditingController.dispose();
    super.onClose();
  }
}