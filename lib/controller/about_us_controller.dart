import 'package:get/get.dart';

class AboutUsController extends GetxController {
  var isLoading = false.obs;

  Future<void> loadAboutUsPage() async {
    isLoading(true);
    try {
      // bankDetails.value = BankDetailsModel(
      //   id: '1',
      //   bankName: 'Dutch Bangla Bank',
      //   branchName: 'Rangpur Branch',
      //   accountName: 'Stock House LTD',
      //   accountNumber: '03597561512145152152',
      //   routingNumber: '23546878984',
      // );

      // remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
      // currentBuyingPrice.value = investmentOpportunityDetails.value.pricePerUnit!.toDouble();

      Get.toNamed("/about_us_page");
    } catch (e) {
      // throw Exception('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}