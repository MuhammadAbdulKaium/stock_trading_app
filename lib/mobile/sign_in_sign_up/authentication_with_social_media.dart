import 'package:flutter/material.dart';

class AuthenticationWithSocialMedia extends StatelessWidget {
  const AuthenticationWithSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 217, 217, 219),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(7)
          ),
          child: SizedBox(
            height: screenWidth * 0.1263888888889,
            width: screenWidth * 0.1263888888889,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.031597222222222221),
              child: Image.asset('images/facebook_icon.png'),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.04861111111111111),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 217, 217, 219),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(7)
          ),
          child: SizedBox(
            height: screenWidth * 0.1263888888889,
            width: screenWidth * 0.1263888888889,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.0328124999999999991),
              child: Image.asset('images/google_icon.png'),
            ),
          ),
        )
      ],
    );
  }
}