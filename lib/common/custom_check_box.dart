import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String checkBoxLabel;
  final bool isChecked;
  final dynamic onChanged;
  final double? height;
  final double? width;
  final double? scale;
  const CustomCheckBox(
    {
      Key? key,
      this.checkBoxLabel = '',
      required this.isChecked,
      required this.onChanged,
      this.height,
      this.width,
      this.scale,
    })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height ?? 24,
              width: width ?? 23,
              child: Transform.scale(
                scale: scale ?? 0.70,
                child: Checkbox(
                  // Remember me
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: const BorderSide(
                    color: Color(0xFFA1A1AA),
                  ),
                  activeColor: const Color(0xFF008037),
                  value: isChecked,
                  onChanged: onChanged,
                ),
              ),
            ),
            const SizedBox(width: 4),
            checkBoxLabel.isNotEmpty 
            ? Text(
              checkBoxLabel,
              style: const TextStyle(
                fontSize: 13, 
                fontWeight: FontWeight.w500,
                color: Color(0xFF71717A),
                fontFamily: 'Gilroy',
              ),
            ) : Container(),
          ],
        ),
      ],
    );
  }
}
