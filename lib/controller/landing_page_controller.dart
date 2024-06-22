import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var isLoading = false.obs;
  final selectedPageIndex = 0.obs;
  final previousPageIndex = 0.obs;

  void changePage(int index, {String? pairId}) {
    if(selectedPageIndex.value != index) {
      previousPageIndex.value = selectedPageIndex.value;
      selectedPageIndex.value = index;

      // scrollController.addListener(() {
      //   scrollPosition.value = scrollController.offset;
      //   pageScrollPositionHistoryStack[selectedPageIndex.value] = scrollController.offset;
      // });
    }

    // if(selectedPageIndex.value < 5) {
    //   canGoBack.value = true;
    //   visitedPageHistoryStack.clear();
    // }
    // else if(selectedPageIndex.value >= 5) {
    //   canGoBack.value = false;

    //   visitedPageHistoryStack.add(previousPageIndex.value);
    // }
    

    // if (scrollController.hasClients) {
    //   scrollController.jumpTo(pageScrollPositionHistoryStack[selectedPageIndex.value]);
    // }
  }
}