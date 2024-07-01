import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/login_controller.dart';
import 'package:stock_trading_app/mobile/app_Introduction_slider.dart';
import 'package:stock_trading_app/mobile/initial_page_mobile.dart';
import 'package:stock_trading_app/mobile/landing_page/landing_mobile.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/forget_password.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/sign_in_sign_up.dart';
import 'package:stock_trading_app/service/shared_preferences_service.dart';
import 'package:stock_trading_app/web/landing_web.dart';
import 'package:stock_trading_app/web/sign_in_sign_up/sign_in_sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final LoginController loginController = Get.put(LoginController());

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
        return FutureBuilder(
          future: loginController.loadCredentials(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false, // This removes the debug banner

                // initialRoute: '/sign_in_sign_up_mobile',
                initialRoute: getInitialRoute(),

                getPages: [
                  GetPage(name: '/app_introduction_slider', page: () => const AppIntroductionSlider()),
                  // GetPage(name: '/sign_in_sign_up_mobile', page: () => const SignInSignUpMobile(), transition: Transition.cupertino),
                  GetPage(name: '/sign_in_sign_up_mobile', page: () => const SignInSignUpMobile(), transition: Transition.native),
                  GetPage(name: '/landing_mobile', page: () => const LandingMobile()),
                  GetPage(name: '/initial_page_mobile', page: () => const InitialPageMobile()),
                  GetPage(name: '/forget_password', page: () => const ForgetPassword(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 1000), ),
                  GetPage(name: '/sign_in_sign_up_web', page: () => const SignInSignUpWeb()),
                  GetPage(name: '/landing_web', page: () => const LandingWeb()),
                ],
              );
            }
          }
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
    // return '/sign_in_sign_up_mobile';
  }
}
