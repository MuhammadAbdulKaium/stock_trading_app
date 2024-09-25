import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stock_trading_app/mobile/sign_in_sign_up/sign_in_sign_up.dart';

class InitialPageMobileController extends GetxController {
  var isFirstTime = true.obs;
  var isLoading = true.obs; // Starts with loading as true
  var hasNavigated = false; // Flag to ensure navigation happens only once 

  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime.value = prefs.getBool('isFirstTime') ?? true;

    // If first time, set it to false for the next app launch
    if (isFirstTime.value) {
      prefs.setBool('isFirstTime', false);
    }
    
    // Stop loading
    isLoading(false); // This will trigger the ever() listener
  }

  // This method handles navigation only after loading completes
  void navigateToNextPage() {
    if (isFirstTime.value) {
      Get.offAllNamed('/app_introduction_slider');
    } else {
      Get.offAllNamed('/sign_in_sign_up_mobile');
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Watch isLoading and perform navigation only when loading is done
    ever(isLoading, (_) {
      if (!isLoading.value && !hasNavigated) {
        navigateToNextPage();
        hasNavigated = true; // Ensure navigation only occurs once
      }
    });
    checkFirstTime();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   print('$runtimeType is being removed from memory');
  // }
}
