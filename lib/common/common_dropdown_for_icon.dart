import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CommonDropdownForIcon extends StatelessWidget {
  final double? height;
  final double? dropdownWidth;
  final List<String> allDropdownValue;
  final Function(String?)? onChanged;
  final Color? dropdownBackgroundColor;
  final double? dropdownFontSize;
  final double? dropdownListFontSize;
  final double? dropdownOptionsSize;
  final dynamic padding;
  final Widget? hint;
  final List<DropdownMenuItem<String>>? items;
  final double? borderRadius;
  final Widget? customButton;
  final Offset? offset;
  const CommonDropdownForIcon(
    {Key? key,
    this.height,
    this.dropdownWidth,
    required this.allDropdownValue,
    required this.onChanged,
    this.dropdownBackgroundColor,
    this.dropdownFontSize,
    this.dropdownListFontSize,
    this.dropdownOptionsSize,
    this.padding,
    this.hint,
    this.items,
    this.borderRadius,
    this.customButton,
    this.offset
    })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: customButton ?? const Icon(
          Icons.list,
          size: 46,
          color: Colors.red,
        ),
        items: items ?? allDropdownValue
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item,
                  style: TextStyle(
                    fontSize: dropdownListFontSize ?? 13.5,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF008037),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        dropdownStyleData: DropdownStyleData(
          // maxHeight: 200,
          width: dropdownWidth ?? 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: -2.5,
                blurRadius: 8.5,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            color: dropdownBackgroundColor ?? const Color(0xFFEAECFF),
          ),
          offset: offset ?? const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: dropdownOptionsSize ?? 35,
          padding: const EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}