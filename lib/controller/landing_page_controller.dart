import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPageController extends GetxController {
  var isLoading = false.obs;
  final selectedPageIndex = 0.obs;
  final selectedDrawerPageIndex = 0.obs;
  final bottomNavigationPageIndex = 0.obs;
  final previousPageIndex = 0.obs;
  final canGoBack = true.obs;
  final isBanglaActive = false.obs;
  final profilePageTabController = 0.obs;

  late ScrollController scrollController;
  final scrollPosition = 0.0.obs;
  var visitedPageHistoryStack = <int>[].obs;
  var pageScrollPositionHistoryStack = <double>[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0].obs;

  // final SharedPreferencesService _sharedPreferences = Get.find<SharedPreferencesService>();
  final userName = 'Loading...'.obs;
  final email = 'Loading...'.obs;
  final photo = ''.obs;

  void changePage(int index, {String? pairId}) {
    if(selectedPageIndex.value != index) {
      previousPageIndex.value = selectedPageIndex.value;
      selectedPageIndex.value = index;

      if(index <= 4) {
        bottomNavigationPageIndex.value = index;
      }
    }

    if(selectedPageIndex.value < 5) {
      canGoBack.value = true;
    }
    else if(selectedPageIndex.value >= 5) {
      canGoBack.value = false;
    }
  }

  void goBack() {
    if (!canGoBack.value) {
      if(visitedPageHistoryStack.isNotEmpty) {
        selectedPageIndex.value = visitedPageHistoryStack.last;
        visitedPageHistoryStack.removeLast();

        if(selectedPageIndex.value < 5) {
          canGoBack.value = true;
          visitedPageHistoryStack.clear();
        }
        else if(selectedPageIndex.value >= 5) {
          canGoBack.value = false;
        }
      }
    }
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('username') ?? '';
    email.value = prefs.getString('email') ?? '';
    photo.value = prefs.getString('photo') ?? '';
  }

  void toggleBanglaActivationState() {
    isBanglaActive.toggle();
  }

  void resetVariables() {
    selectedPageIndex.value = 0;
    previousPageIndex.value = 0;
  }

  Future<void> logout() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString('emailForRememberMe');
    String? password = prefs.getString('passwordForRememberMe');
    bool? isFirstTime = prefs.getBool('isFirstTime');

    // Clear all preferences
    await prefs.clear();

    // Restore the remembered email and password
    if (email != null) {
      await prefs.setString('emailForRememberMe', email);
    }
    if (password != null) {
      await prefs.setString('passwordForRememberMe', password);
    }
    if (isFirstTime != null) {
      await prefs.setBool('isFirstTime', isFirstTime);
    }

    Get.offAllNamed('/sign_in_sign_up_mobile');
    
    isLoading(false);
  }

  @override
  void onInit() async {
    super.onInit();
    changePage(0);
    scrollController = ScrollController();
    _loadUserInfo();
    // Get.lazyPut<CashOutController>(() => CashOutController());
    // Get.lazyPut<ProfileController>(() => ProfileController());
    // Get.lazyPut(() => ProfileController(), fenix: true);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}