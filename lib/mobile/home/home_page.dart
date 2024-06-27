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
    return const Column(
      children: [
        SizedBox(height: 13,),
        WelcomeMessage(),
        SizedBox(height: 35,),
        WelcomeImage(),
        SizedBox(height: 45,),
        Summary(),
        SizedBox(height: 45,),
        ProductCategories(),
        SizedBox(height: 50,),
        LearnAsYouGo(),
        SizedBox(height: 55,),
        ActiveCropsToBuy(),
        SizedBox(height: 20,),
        BestOffers(),
      ],
    );
  }
}