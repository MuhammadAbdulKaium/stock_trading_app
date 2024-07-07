import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stock_trading_app/service/shared_preferences_service.dart';

class LandingPageController extends GetxController {
  var isLoading = false.obs;
  final selectedPageIndex = 0.obs;
  final bottomNavigationPageIndex = 0.obs;
  final previousPageIndex = 0.obs;
  final canGoBack = true.obs;
  final isBanglaActive = false.obs;

  late ScrollController scrollController;
  final scrollPosition = 0.0.obs;
  var visitedPageHistoryStack = <int>[].obs;
  var pageScrollPositionHistoryStack = <double>[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0].obs;

  // final SharedPreferencesService _sharedPreferences = Get.find<SharedPreferencesService>();
  final userName = 'Loading...'.obs;
  final email = 'Loading...'.obs;

  void changePage(int index, {String? pairId}) {
    if(selectedPageIndex.value != index) {
      previousPageIndex.value = selectedPageIndex.value;
      selectedPageIndex.value = index;

      if(index <= 4) {
        bottomNavigationPageIndex.value = index;
      }

      // print('Selected Page Index:::: ${selectedPageIndex.value}');
      // scrollController.addListener(() {
      //   scrollPosition.value = scrollController.offset;
      //   pageScrollPositionHistoryStack[selectedPageIndex.value] = scrollController.offset;
      // });
    }

    if(selectedPageIndex.value < 5) {
      canGoBack.value = true;
      // visitedPageHistoryStack.clear();
    }
    else if(selectedPageIndex.value >= 5) {
      canGoBack.value = false;

      // visitedPageHistoryStack.add(previousPageIndex.value);
    }
    

    // if (scrollController.hasClients) {
    //   scrollController.jumpTo(pageScrollPositionHistoryStack[selectedPageIndex.value]);
    // }
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
    userName.value = prefs.getString('username')!;
    email.value = prefs.getString('email')!;
  }

  void toggleBanglaActivationState() {
    isBanglaActive.toggle();
  }

  void resetVariables() {
    selectedPageIndex.value = 0;
    previousPageIndex.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    _loadUserInfo();
  }

  @override
  void onClose() {
    scrollController.dispose();
    resetVariables();
    super.onClose();
  }
}