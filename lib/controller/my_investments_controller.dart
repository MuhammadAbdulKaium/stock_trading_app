import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/my_investments_api.dart';
import 'package:stock_trading_app/common/common_error_dialog.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/models/my_investment_model.dart';

class MyInvestmentsController extends GetxController{
  final LandingPageController landingPageController = Get.find<LandingPageController>();
  final pendingInvestment = 0.obs;
  final activeInvestment = 0.obs;
  final actionRequired = 0.obs;
  final readyForCashout = 0.0.obs;
  final myInvestment = MyInvestmentModel().obs;

  var token = ''.obs;
  late SharedPreferences prefs;
  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  final MyInvestmentsApi _myInvestmentsApi = MyInvestmentsApi();
  void loadMyInvestments() async {
    try {
      landingPageController.isLoading.value = true;

      final response = await _myInvestmentsApi.getMyInvestments(token.value);

      if (response.statusCode == 200) {
        myInvestment.value = MyInvestmentModel.fromJson(response.data);
        pendingInvestment.value = myInvestment.value.pendingInvestment ?? 0;
        activeInvestment.value = myInvestment.value.activeInvestment ?? 0;
        readyForCashout.value = myInvestment.value.readyForCashout ?? 0.0;
      } else {
        Get.dialog(const CommonErrorDialog(title: 'Error', message: 'Failed to load Investments.'));
      }
    } catch (e) {
      Get.snackbar(
        'Error', 
        'An error occurred: $e',
        duration: const Duration(seconds: 5),
      );
    } finally {
      landingPageController.isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await initializeToken();
    loadMyInvestments ();
  }
}