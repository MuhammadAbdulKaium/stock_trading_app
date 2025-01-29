import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/booking_api.dart';
import 'package:stock_trading_app/common/common_error_dialog.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/controller/investment_opportunity_details_controller.dart';
import 'package:stock_trading_app/controller/marketplace_controller.dart';
import 'package:stock_trading_app/controller/my_investments_controller.dart';
import 'package:stock_trading_app/models/product_model.dart';

class ConfirmationController extends GetxController {
  final InvestmentOpportunityDetailsController investmentOpportunityDetailsController = Get.find<InvestmentOpportunityDetailsController>();
  final MyInvestmentsController myInvestmentsController = Get.put(MyInvestmentsController());
  final MarketplaceController marketplaceController = Get.find<MarketplaceController>();
  var investmentDetails = ProductModel().obs;
  var isLoading = false.obs;

  final lotSizeToBuy = 0.obs;
  final totalWithoutAssociatedCost = 0.0.obs;
  final totalPayableAmount = 0.0.obs;
  final totalMonthlyStoreCost = 0.0.obs;
  final totalTransportCost = 0.0.obs;
  final totalHandlingFees = 0.0.obs;
  final totalAdditionalCost = 0.0.obs;

  Future<void> loadConfirmationPage() async {
    isLoading(true);
    try {
      investmentDetails.value = investmentOpportunityDetailsController.investmentOpportunityDetails.value;
      totalPayableAmount.value = investmentOpportunityDetailsController.calculateTotalPayableAmount();
      lotSizeToBuy.value = investmentOpportunityDetailsController.enteredLotNumerToBuy.value;
      totalWithoutAssociatedCost.value = lotSizeToBuy.value * (investmentDetails.value.pricePerUnit ?? 0.0);
      totalMonthlyStoreCost.value = lotSizeToBuy.value * (investmentDetails.value.warehouse?.monthlyStorageCost ?? 0.0);
      totalTransportCost.value = lotSizeToBuy.value * (investmentDetails.value.transportCost ?? 0.0);
      totalHandlingFees.value = lotSizeToBuy.value * (investmentDetails.value.handlingCost ?? 0.0);
      totalAdditionalCost.value = lotSizeToBuy.value * (investmentDetails.value.additionalCost ?? 0.0);

      Get.toNamed("/confirmation_page");
    } catch (e) {
      // throw Exception('Error: $e');
      // print(e);
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

  var token = ''.obs;
  late SharedPreferences prefs;
  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }
  
  final BookingApi _bookingApi = BookingApi();
  Future<void> bookingProduct() async {
    isLoading(true);
    try {

      final response = await _bookingApi.bookingProduct(
        investmentOpportunityDetailsController.investmentOpportunityDetails.value.id ?? '', 
        investmentOpportunityDetailsController.enteredLotNumerToBuy.value, 
        token.value
      );
      
      if (response.statusCode == 201) {
        Get.snackbar(
          'Order Status', 
          'Order placed successfully! Please provide payment proof.',
          duration: const Duration(seconds: 5),
        );
        
        marketplaceController.updateAllProductToInvest();
        myInvestmentsController.loadMyInvestments();
        Get.toNamed("/payment_proof_page",
          arguments: {
            'id': investmentOpportunityDetailsController.investmentOpportunityDetails.value.id,
          }
        );
      } else if (response.statusCode == 400) {
        Get.dialog(CommonErrorDialog(title: 'Error', message: response.data['message']));
      } else {
        Get.dialog(const CommonErrorDialog(title: 'Error', message: 'Something went wrong please try again.'));
      }
    } catch (e) {
      // throw Exception('Error: $e');
      // print(e);
      Get.dialog(const CommonErrorDialog(title: 'Error', message: 'Something went wrong please try again.'));
    } finally {
      isLoading(false);
    }
  }
  // void resetVariables() {
  //   totalPayableAmount.value = 0.0;
  // }

  @override
  void onInit() async {
    await initializeToken();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}