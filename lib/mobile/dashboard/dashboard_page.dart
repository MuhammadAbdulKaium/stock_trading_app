// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stock_trading_app/mobile/dashboard/overview.dart';
import 'package:stock_trading_app/mobile/dashboard/pending_investments.dart';
import 'package:stock_trading_app/mobile/dashboard/ready_for_withdraw.dart';
import 'package:stock_trading_app/mobile/dashboard/sell_in_progress.dart';
import 'package:stock_trading_app/mobile/dashboard/total_funded_and_earnings.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.031,),
        const Overview(),
        SizedBox(height: screenHeight * 0.031,),
        const TotalFundedAndEarnings(),
        SizedBox(height: screenHeight * 0.031,),
        const PendingInvestments(),
        SizedBox(height: screenHeight * 0.031,),
        const SellInProgress(),
        SizedBox(height: screenHeight * 0.031,),
        const ReadyForWithdraw(),
        SizedBox(height: screenHeight * 0.031,),
      ],
    );
  }
}