import 'package:get/get.dart';
import 'package:stock_trading_app/models/frequently_asked_questions_model.dart';

class HowMunafaWorksController extends GetxController {
  var isLoading = false.obs;
  Rxn<List<FrequentlyAskedQuestionsModel>> faqItems = Rxn<List<FrequentlyAskedQuestionsModel>>();

  void toggleFAQ(int index) {
    if (faqItems.value != null) {
      // faqItems.value![index].isExpanded = !faqItems.value![index].isExpanded;
      // faqItems.refresh();
      for (int i = 0; i < faqItems.value!.length; i++) {
        if (i == index) {
          faqItems.value![i].isExpanded = !faqItems.value![i].isExpanded;
        } else {
          faqItems.value![i].isExpanded = false; // Collapse other items
        }
      }
      faqItems.refresh();
    }
  }

  Future<void> loadHowMunafaWorksPage() async {
    isLoading(true);
    try {
      faqItems.value = <FrequentlyAskedQuestionsModel>[
        FrequentlyAskedQuestionsModel(question: 'What is Munafa?', answer: 'Begin by creating an account on the Munafa platform. Once registered, you can explore the marketplace, view live commodity prices, and use our tools to make informed trading decisions.'),
        FrequentlyAskedQuestionsModel(question: 'How do I start trading on Munafa?', answer: 'Begin by creating an account on the Munafa platform. Once registered, you can explore the marketplace, view live commodity prices, and use our tools to make informed trading decisions.'),
        FrequentlyAskedQuestionsModel(question: 'Can I store the Agri-Products?', answer: 'Begin by creating an account on the Munafa platform. Once registered, you can explore the marketplace, view live commodity prices, and use our tools to make informed trading decisions.'),
        FrequentlyAskedQuestionsModel(question: 'What types of Crops can I trade on Munafa?', answer: 'Begin by creating an account on the Munafa platform. Once registered, you can explore the marketplace, view live commodity prices, and use our tools to make informed trading decisions.'),
        FrequentlyAskedQuestionsModel(question: 'Are there any fees associated with trading on Munafa?', answer: 'Begin by creating an account on the Munafa platform. Once registered, you can explore the marketplace, view live commodity prices, and use our tools to make informed trading decisions.'),
        FrequentlyAskedQuestionsModel(question: 'What happens if the market price of a stored crops changes?', answer: 'Begin by creating an account on the Munafa platform. Once registered, you can explore the marketplace, view live commodity prices, and use our tools to make informed trading decisions.'),
      ];

      Get.toNamed("/how_munafa_works_page");
    } catch (e) {
      // throw Exception('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}