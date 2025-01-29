class MyInvestmentModel {
  final int? pendingInvestment;
  final int? activeInvestment;
  final int? totalProductInvestment;
  final int? totalDurationInDay;
  final int? totalDurationInMonth;
  final double? totalStorageCost;
  final double? totalCost;
  final double? readyForCashout;

  MyInvestmentModel({
    this.pendingInvestment,
    this.activeInvestment,
    this.totalProductInvestment,
    this.totalDurationInDay,
    this.totalDurationInMonth,
    this.totalStorageCost,
    this.totalCost,
    this.readyForCashout,
  });

  // Factory constructor to create an instance from a JSON response
  factory MyInvestmentModel.fromJson(Map<String, dynamic> json) {
    return MyInvestmentModel(
      pendingInvestment: json['pending_investment'],
      activeInvestment: json['active_investment'],
      totalProductInvestment: json['total_product_investment'],
      totalDurationInDay: json['total_duration_in_day'],
      totalDurationInMonth: json['total_duration_in_month'],
      totalStorageCost: (json['total_storage_cost'] as num?)?.toDouble(),
      totalCost: (json['total_cost'] as num?)?.toDouble(),
      readyForCashout: (json['ready_for_cashout'] as num?)?.toDouble(),
    );
  }
}
