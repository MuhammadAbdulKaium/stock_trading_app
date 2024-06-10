import 'package:flutter/material.dart';
import 'package:stock_trading_app/mobile/sign_in_sign_up/login_form.dart';

class SignInSignUpMobile extends StatelessWidget {
  const SignInSignUpMobile({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0, right: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 131,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 74,
                          child: Image.asset(
                            'images/app_icon_inner_page.png',
                            fit: BoxFit.contain,
                            height: 74,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}