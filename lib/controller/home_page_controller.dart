import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/products_to_invest_api.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/models/product_model.dart';
import 'package:dio/dio.dart' as dio;

class HomePageController extends GetxController {
  final LandingPageController landingPageController = Get.find<LandingPageController>();
  final activeInvestments = 06.obs;
  final actionRequired = 02.obs;
  final currentlyInvested = 2000.obs;
  final withdrawable = 2000.obs;
  final currentProfit = 2000.obs;
  final RxList<ProductModel> activeCropsToInvest = <ProductModel>[].obs;
  final RxList<ProductModel> bestOffers = <ProductModel>[].obs;
  var token = ''.obs;
  late SharedPreferences prefs;

  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  String extractFirstName(String fullName) {
    return fullName.split(' ').first;
  }

  final pageController = PageController(
    initialPage: 1, 
    viewportFraction: 0.5, // Show 50% of each page
  );
  Timer? _timer;
  final _numberOfPages = 4;

  final ProductsToInvestApi _productsToInvestApi = ProductsToInvestApi();
  Future<void> getAllProductToInvest() async {
    try {
      landingPageController.isLoading(true);
      
      dio.Response response = await _productsToInvestApi.getAllProduct(token.value);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        
        // Convert the list of JSON objects into a list of ProductModel
        final products = data.map((jsonItem) => ProductModel.fromJson(jsonItem)).toList();

        // Assign the products to investmentOpportunities
        activeCropsToInvest.assignAll(products);
      } else {
        // Handle non-200 responses, show error if necessary
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      landingPageController.isLoading(false);
    }
  }

  Future<void> getBestProductsToInvest() async {
    try {
      landingPageController.isLoading(true);
      
      dio.Response response = await _productsToInvestApi.getAllProduct(token.value);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        
        // Convert the list of JSON objects into a list of ProductModel
        final products = data.map((jsonItem) => ProductModel.fromJson(jsonItem)).toList();

        // Assign the products to investmentOpportunities
        bestOffers.assignAll(products);
      } else {
        // Handle non-200 responses, show error if necessary
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      landingPageController.isLoading(false);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoSlide();
    });
    await initializeToken();
    await getAllProductToInvest();
    await getBestProductsToInvest();
  }

  @override
  void onClose() {
    _timer?.cancel(); // Stop the timer when the controller is disposed
    super.onClose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      if (pageController.hasClients) {
        final currentPage = (pageController.page ?? 0).toInt();
        final nextPage = (currentPage + 1) % _numberOfPages;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500), // Adjust animation duration
          curve: Curves.easeInOut,
        );
      }
    });
  }
}