import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 11,
                  child: SizedBox(
                    // height: 131,
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
                ),
                Flexible(
                  flex: 63,
                  child: Container()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}