import 'package:get/get.dart';

class ContactUsController extends GetxController {
  var isLoading = false.obs;

  Future<void> loadContactUsPage() async {
    isLoading(true);
    try {
      // notifications.assignAll([
      //   NotificationModel(
      //     title: 'Transaction successful',
      //     message: 'Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.',
      //     imageUrl: '',
      //     time: DateTime.now(),
      //   ),
      //   NotificationModel(
      //     title: 'Transaction successful',
      //     message: 'Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.',
      //     imageUrl: '',
      //     time: DateTime.now(),
      //   ),
      //   NotificationModel(
      //     title: 'Transaction successful',
      //     message: 'Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.',
      //     imageUrl: '',
      //     time: DateTime.now(),
      //   ),
      // ]);

      // remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
      // currentBuyingPrice.value = investmentOpportunityDetails.value.pricePerUnit!.toDouble();
    } catch (e) {
      // throw Exception('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await loadContactUsPage();
  }
}