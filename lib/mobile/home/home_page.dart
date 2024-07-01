// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stock_trading_app/mobile/home/active_crops_to_buy.dart';
import 'package:stock_trading_app/mobile/home/best_offers.dart';
import 'package:stock_trading_app/mobile/home/learn_as_you_go.dart';
import 'package:stock_trading_app/mobile/home/product_categories.dart';
import 'package:stock_trading_app/mobile/home/summary.dart';
import 'package:stock_trading_app/mobile/home/welcome_image.dart';
import 'package:stock_trading_app/mobile/home/welcome_message.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.0166666,),
        const WelcomeMessage(),
        SizedBox(height: screenHeight * 0.0448718,),
        const WelcomeImage(),
        SizedBox(height: screenHeight * 0.0515,),
        const Summary(),
        SizedBox(height: screenHeight * 0.0510,),
        const ProductCategories(),
        SizedBox(height: screenHeight * 0.0540,),
        const LearnAsYouGo(),
        SizedBox(height: screenHeight * 0.0585,),
        const ActiveCropsToBuy(),
        SizedBox(height: screenHeight * 0.0140,),
        const BestOffers(),
      ],
    );
  }
}