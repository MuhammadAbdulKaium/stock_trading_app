// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stock_trading_app/mobile/marketplace/investment_opportunities.dart';
import 'package:stock_trading_app/mobile/marketplace/profitable_sellings.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.0510,),
        const InvestmentOpportunities(),
        SizedBox(height: screenHeight * 0.0140,),
        const ProfitableSellings(),
      ],
    );
  }
}