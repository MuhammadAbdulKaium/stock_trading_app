import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stock_trading_app/mobile/sign_in_sign_up/sign_in_sign_up.dart';

class InitialPageMobileController extends GetxController {
  var isFirstTime = true.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkFirstTime();
  }

  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime.value = prefs.getBool('isFirstTime') ?? true;
    isLoading.value = false;

    // if (isFirstTime.value) {
    //   prefs.setBool('isFirstTime', false);
    //   Get.offAllNamed('/app_introduction_slider');
    // } else {
    //   Get.offAllNamed('/sign_in_sign_up_mobile');
    //   // Get.offAll(() => const SignInSignUpMobile());
    // }
  }
}
