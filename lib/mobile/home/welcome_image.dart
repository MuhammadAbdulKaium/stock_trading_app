// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container()
        ),
        Expanded(
          flex: 100,
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: Image.asset(
              'images/welcome_image.png',
              fit: BoxFit.cover,
              // height: 74,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container()
        ),
      ],
    );
  }
}