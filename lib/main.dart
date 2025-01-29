import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/mobile/about_us/about_us_page.dart';
import 'package:stock_trading_app/mobile/active_investment/active_investment_page.dart';
import 'package:stock_trading_app/mobile/app_Introduction_slider.dart';
import 'package:stock_trading_app/mobile/booking/booking_page.dart';
import 'package:stock_trading_app/mobile/cash_out/cash_out_page.dart';
import 'package:stock_trading_app/mobile/confirmation/confirmation_page.dart';
import 'package:stock_trading_app/mobile/contact_us/contact_us_page.dart';
import 'package:stock_trading_app/mobile/how_munafa_works/how_munafa_works_page.dart';
import 'package:stock_trading_app/mobile/initial_page_mobile.dart';
import 'package:stock_trading_app/mobile/investment_opportunity_details/investment_opportunity_details_page.dart';
import 'package:stock_trading_app/mobile/landing_page/landing_mobile.dart';
import 'package:stock_trading_app/mobile/market_trends/market_trends_page.dart';
import 'package:stock_trading_app/mobile/news_and_blogs/news_and_blogs_page.dart';
import 'package:stock_trading_app/mobile/notification/notification_page.dart';
import 'package:stock_trading_app/mobile/order_details/order_details_page.dart';
import 'package:stock_trading_app/mobile/payment_proof/payment_proof_page.dart';
import 'package:stock_trading_app/mobile/progress/progress_page.dart';
import 'package:stock_trading_app/mobile/sell/sell_page.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/forget_password.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/sign_in_sign_up.dart';
import 'package:stock_trading_app/mobile/summary/summary_page.dart';
import 'package:stock_trading_app/mobile/support/support_page.dart';
import 'package:stock_trading_app/service/shared_preferences_service.dart';
import 'package:stock_trading_app/web/landing_web.dart';
import 'package:stock_trading_app/web/sign_in_sign_up/sign_in_sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async   {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SharedPreferencesService().init()); // Ensure initialization before other services

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set any color you want here
      statusBarIconBrightness: Brightness.dark, // Light icons or Brightness.dark for dark icons
      statusBarBrightness: Brightness.dark, // This is used for iOS (optional)
    )
  );

  // Get.lazyPut<CashOutController>(() => CashOutController());
  // Get.lazyPut<ProfileController>(() => ProfileController());
  // Get.lazyPut(() => ProfileController(), fenix: true);

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ]
    );

    return ScreenUtilInit(
      designSize: const Size(360, 780), // Set the design size (based on your design)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false, // This removes the debug banner

          // initialRoute: '/initial_page_mobile',
          initialRoute: getInitialRoute(),

          getPages: [
            GetPage(name: '/app_introduction_slider', page: () => const AppIntroductionSlider()),
            GetPage(name: '/sign_in_sign_up_mobile', page: () => const SignInSignUpMobile(), transition: Transition.native, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/landing_mobile', page: () => const LandingMobile(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/initial_page_mobile', page: () => const InitialPageMobile()),
            GetPage(name: '/forget_password', page: () => const ForgetPassword(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 1000)),
            GetPage(name: '/cash_out', page: () => const CashOutPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/summary', page: () => const SummaryPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/active_investment', page: () => const ActiveInvestmentPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/order_details_page', page: () => const OrderDetailsPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/progress_page', page: () => const ProgressPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/sell_page', page: () => const SellPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/investment_opportunity_details_page', page: () => const InvestmentOpportunityDetailsPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/booking_page', page: () => const BookingPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/confirmation_page', page: () => const ConfirmationPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/payment_proof_page', page: () => const PaymentProofPage(), transition: Transition.fade, transitionDuration: const Duration(milliseconds: 300)),

            GetPage(name: '/market_trends_page', page: () => const MarketTrendsPage(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/about_us_page', page: () => const AboutUsPage(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/news_and_blogs_page', page: () => const NewsAndBlogsPage(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/how_munafa_works_page', page: () => const HowMunafaWorksPage(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/contact_us_page', page: () => const ContactUsPage(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/support', page: () => const SupportPage(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),
            GetPage(name: '/notification_page', page: () => const NotificationPage(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 300)),

            GetPage(name: '/sign_in_sign_up_web', page: () => const SignInSignUpWeb()),
            GetPage(name: '/landing_web', page: () => const LandingWeb()),
          ],
        );
      }
    );
  }
}

String getInitialRoute() {
  if (kIsWeb) {
    return '/sign_in_sign_up_web';
  } else {
    return '/initial_page_mobile';
    // return '/notification_page';
  }
}
