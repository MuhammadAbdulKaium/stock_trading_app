import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/models/product_model.dart';

class HomePageController extends GetxController {
  final activeInvestments = 06.obs;
  final actionRequired = 02.obs;
  final currentlyInvested = 2000.obs;
  final withdrawable = 2000.obs;
  final currentProfit = 2000.obs;
  final RxList<Product> activeCropsToBuy = <Product>[].obs;
  final RxList<Product> bestOffers = <Product>[].obs;

  // final pageController = PageController(
  //   initialPage: 1, 
  //   viewportFraction: 0.5, // Show 50% of each page
  // );
  // Timer? _timer;

  String extractFirstName(String fullName) {
    return fullName.split(' ').first;
  }

  final pageController = PageController(
    initialPage: 1, 
    viewportFraction: 0.5, // Show 50% of each page
  );
  Timer? _timer;
  final _numberOfPages = 4;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoSlide();
    });

    activeCropsToBuy.assignAll([
      Product(productId: '1', productName: 'Aman Rice', productCategory: 'rice', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000),
      Product(productId: '2', productName: 'Corn', productCategory: 'corn', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000),
    ]);

    bestOffers.assignAll([
      Product(productId: '1', productName: 'Corn', productCategory: 'corn', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000)
    ]);
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