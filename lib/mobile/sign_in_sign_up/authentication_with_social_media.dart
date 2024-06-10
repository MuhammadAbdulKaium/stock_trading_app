import 'package:flutter/material.dart';

class AuthenticationWithSocialMedia extends StatelessWidget {
  const AuthenticationWithSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 52,
            width: 52,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Image.asset('images/facebook_icon.png'),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 217, 217, 219),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(7)
          ),
          child: SizedBox(
            height: 52,
            width: 52,
            child: Padding(
              padding: const EdgeInsets.all(13.5),
              child: Image.asset('images/google_icon.png'),
            ),
          ),
        )
      ],
    );
  }
}