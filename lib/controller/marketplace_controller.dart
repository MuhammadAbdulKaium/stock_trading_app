import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/products_to_invest_api.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/models/product_model.dart';
import 'package:dio/dio.dart' as dio;

class MarketplaceController extends GetxController {
  final LandingPageController landingPageController = Get.find<LandingPageController>();
  final RxList<ProductModel> investmentOpportunities = <ProductModel>[].obs;
  final RxList<ProductModel> profitableSellings = <ProductModel>[].obs;
  var token = ''.obs;
  late SharedPreferences prefs;

  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

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
        investmentOpportunities.assignAll(products);
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
    await initializeToken();
    await getAllProductToInvest();
    // investmentOpportunities.assignAll([
    //   Product(productId: '1', productName: 'Aman Rice', productCategory: 'rice', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000),
    //   Product(productId: '2', productName: 'Corn', productCategory: 'corn', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000),
    // ]);

    // profitableSellings.assignAll([
    //   ProductModel(id: '1', name: 'Corn', imageUrl: '', status: true,),
    //   // Product(productId: '1', productName: 'Corn', productCategory: 'corn', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000)
    // ]);
  }
}