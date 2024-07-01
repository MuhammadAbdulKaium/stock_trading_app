// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stock_trading_app/mobile/my_investments/event_calendar.dart';
import 'package:stock_trading_app/mobile/my_investments/my_investment_summary.dart';

class MyInvestmentsPage extends StatelessWidget {
  const MyInvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.0230,),
        const MyInvestmentSummary(),
        SizedBox(height: screenHeight * 0.0550,),
        const EventCalendar(),
        SizedBox(height: screenHeight * 0.0300,),
      ],
    );
  }
}