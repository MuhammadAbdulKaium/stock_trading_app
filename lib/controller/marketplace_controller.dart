import 'package:get/get.dart';
import 'package:stock_trading_app/models/product_model.dart';

class MarketplaceController extends GetxController {
  final RxList<Product> investmentOpportunities = <Product>[].obs;
  final RxList<Product> profitableSellings = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    investmentOpportunities.assignAll([
      Product(productId: '1', productName: 'Aman Rice', productCategory: 'rice', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000),
      Product(productId: '2', productName: 'Corn', productCategory: 'corn', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000),
    ]);

    profitableSellings.assignAll([
      Product(productId: '1', productName: 'Corn', productCategory: 'corn', productStatus: 'Active', conversionPercentage: '+5', purchasePrice: 1000, sellingPrice: 1000, monthlyStorageCost: 1000)
    ]);
  }
}