import 'package:flutter/material.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';

class CommonErrorDialog extends StatelessWidget {
  final String title;
  final String message;

  const CommonErrorDialog({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomAlartDialog(
      begin: 0,
      end: 0,
      alignment: Alignment.bottomCenter,
      duration: 300,
      borderRadius: const BorderRadius.all(Radius.circular(0)),
      horizontalPadding: 0,
      backgroundColor: Colors.red,
      dialogHeader: title.isNotEmpty 
      ? SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12.5,
                color: Colors.white,
                fontFamily: 'FontCircularStd',
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      )
      : Container(),
      dialogContent: message.isNotEmpty 
      ? SizedBox(
        height: 60,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.042),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.white,
                  fontFamily: 'FontCircularStd',
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      )
      : Container(),
    );
  }
}