import 'package:get/get.dart';
import 'package:stock_trading_app/models/nominee_details_model.dart';

class NomineeController extends GetxController {
  var nomineeDetails = NomineeDetailsModel().obs;

  Future<void> loadNomineeDetails() async {
    try {
      nomineeDetails.value = NomineeDetailsModel(
        id: '1',
        // bankName: 'Dutch Bangla Bank',
        // branchName: 'Rangpur Branch',
        // accountName: 'Stock House LTD',
        // accountNumber: '03597561512145152152',
        // routingNumber: '23546878984',
      );

      // remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
      // currentBuyingPrice.value = investmentOpportunityDetails.value.pricePerUnit!.toDouble();

    } catch (e) {
      // throw Exception('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
}