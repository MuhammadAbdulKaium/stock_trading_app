import 'package:flutter/material.dart';

class SignInSignUpWeb extends StatelessWidget {
  const SignInSignUpWeb({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'sign_in_sign_up_web',
            ),
          ],
        ),
      ),
    );
  }
}