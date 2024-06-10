import 'package:get/get.dart';

class AppIntroductionSliderController extends GetxController {
  var currentIndex = 0.obs;
  var isFading = false.obs;

  final List<String> images = [
    'images/welcome_to_munafa/welcome_to_munafa_top_layer.png',
    'images/invest_with_ease/invest_with_ease_top_layer.png',
    'images/profit_and_manage/Profit_and_manage_top_layer.png',
  ];

  final List<String> shadowImages = [
    'images/welcome_to_munafa/welcome_to_munafa_bottom_layer.png',
    'images/invest_with_ease/invest_with_ease_bottom_layer.png',
    'images/profit_and_manage/Profit_and_manage_bottom_layer.png',
  ];

  final List<String> titles = [
    'Welcome to Munafa',
    'Invest with Ease',
    'Profit and Manage',
  ];

  final List<String> texts = [
    "Your Gateway to Agricultural Investing! Discover a world where trading and investing in agricultural commodities like seeds, crops, and vegetables is seamless and empowering. Join our community and revolutionize the way you invest in agriculture. Let's grow together!",
    "Choose Your Commodity, Any Quantity! Browse through our extensive catalog of agricultural commodities with real-time stock prices. Purchase the quantity you desire and manage your investments directly through Munafa. Secure payments, transparent transactions, and immediate stocking in optimal conditions – it's all here for you.",
    "Your Investment, Your Control. Store your investments safely with us and decide when to sell. With Munafa, you're in charge of your profts. Sell your commodities through our platform when the time is right, and enjoy the returns on your capital, hassle-free. Welcome to smart, fexible, and proftable agricultural investing.",
  ];

  void next() async {
    if (isFading.value) return;

    if (currentIndex.value < images.length - 1) {
      isFading.value = true;
      await Future.delayed(const Duration(milliseconds: 200));
      // currentIndex.value = (currentIndex.value + 1) % images.length;
      currentIndex.value = currentIndex.value + 1;
      isFading.value = false;
    }
    else if (currentIndex.value >= images.length - 1) {
      return Get.offAllNamed(
        '/sign_in_sign_up_mobile',
        // transition: Transition.fadeIn, // You can choose any transition type
        // duration: Duration(milliseconds: 500), // Adjust the duration as needed
      );
    }

    // isFading.value = true;
    // await Future.delayed(const Duration(milliseconds: 200));
    // currentIndex.value = (currentIndex.value + 1) % images.length;
    // isFading.value = false;
  }
}
