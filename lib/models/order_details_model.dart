class OrderDetailsModel {
  String? id;
  String? name;
  String? category;
  String? status;
  String? warehouse;
  String? type;
  String? regionOfOrigin;
  double? lotSize;
  double? pricePerUnit;
  String? storageConditions;
  String? optimalStorageTemperature;
  double? monthlyStoreCost;
  double? transportCost;
  double? handlingFees;
  OrderDetailsModel({
    this.id,
    this.name,
    this.category,
    this.status,
    this.warehouse,
    this.type,
    this.regionOfOrigin,
    this.lotSize,
    this.pricePerUnit,
    this.storageConditions,
    this.optimalStorageTemperature,
    this.monthlyStoreCost,
    this.transportCost,
    this.handlingFees,
  });
}