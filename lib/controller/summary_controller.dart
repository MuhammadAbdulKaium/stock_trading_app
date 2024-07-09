import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/models/transaction_summary.dart';

class SummaryController extends GetxController {
  var isLoading = false.obs;
  final portfolioBalance = 200.obs;
  // Dummy data for the chart
  final List<FlSpot> xDataPoints = [
    const FlSpot(0, 55000),
    const FlSpot(1, 85000),
    const FlSpot(2, 60000),
    const FlSpot(3, 125000),
    const FlSpot(4, 60000),
    const FlSpot(5, 50000)
  ].obs;

  final List<FlSpot> yDataPoints = [
    const FlSpot(0, 93000),
    const FlSpot(1, 60000),
    const FlSpot(2, 85000),
    const FlSpot(3, 150000),
    const FlSpot(4, 80000),
    const FlSpot(5, 60000)
  ].obs;

  final RxList<TransactionSummary> transactionSummaryList = <TransactionSummary>[].obs;

  @override
  void onInit() {
    super.onInit();

    transactionSummaryList.assignAll([
      TransactionSummary(productName: 'Potato', startDate: DateTime.now(), quantity: 2, purchasePrice: 400, sellPrice: 200, earning: 200),
      TransactionSummary(productName: 'Rice', startDate: DateTime.now(), quantity: 3, purchasePrice: 500, sellPrice: 200, earning: 300)
    ]);
  }
}