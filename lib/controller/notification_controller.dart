import 'package:get/get.dart';
import 'package:stock_trading_app/models/notification_model.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notifications = <NotificationModel>[].obs;
  final selectedNotificationCategory = ''.obs;
  List<String> notificationCategoryList = ['All', 'Transactions', 'Warehouse Updates', 'Account Activity'];

  void updateNotificationCategory(String input) {
    selectedNotificationCategory.value = input;
  }

  Future<void> loadNotificationPage() async {
    isLoading(true);
    try {
      notifications.assignAll([
        NotificationModel(
          title: 'Transaction successful',
          message: 'Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.',
          imageUrl: '',
          time: DateTime.now(),
        ),
        NotificationModel(
          title: 'Transaction successful',
          message: 'Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.',
          imageUrl: '',
          time: DateTime.now(),
        ),
        NotificationModel(
          title: 'Transaction successful',
          message: 'Your purchase of 100 units of Wheat at 20 BDT/unit has been confirmed.',
          imageUrl: '',
          time: DateTime.now(),
        ),
      ]);

      // remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
      // currentBuyingPrice.value = investmentOpportunityDetails.value.pricePerUnit!.toDouble();

      // Get.toNamed("/notification_page");
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
    await loadNotificationPage();
  }
}