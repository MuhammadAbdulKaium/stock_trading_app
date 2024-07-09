class ActiveInvestmentModel {
  String? productId;
  String? productName;
  String? productCategory;
  String? productStatus;
  String? conversionPercentage;
  double? totalFunded;
  double? quantityAvailable;
  double? purchasePricePerMT;
  double? monthlyStorageCostPerMT;
  double? currentSellingPricePerMT;
  DateTime? purchaseDate;

  ActiveInvestmentModel({
    required this.productId, 
    this.productName, 
    this.productCategory, 
    this.productStatus, 
    this.conversionPercentage, 
    this.totalFunded, 
    this.quantityAvailable, 
    this.purchasePricePerMT,
    this.monthlyStorageCostPerMT,
    this.currentSellingPricePerMT,
    this.purchaseDate,
  });
}