import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            // value: 0.2,
            color: const Color(0xFF008037),
            backgroundColor: Colors.grey[200],
            strokeWidth: 4.35,
          ),
        ),
      ),
    );
  }
}