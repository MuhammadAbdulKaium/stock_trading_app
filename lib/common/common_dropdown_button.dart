import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class CommonDropdownButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String selectedDropdownValue;
  final List<String> allDropdownValue;
  final Function(String?)? onChanged;
  final Color? buttonBackgroundColor;
  final Color? dropdownBackgroundColor;
  final double? dropdownFontSize;
  final double? dropdownListFontSize;
  final double? dropdownOptionsSize;
  final dynamic padding;
  final Widget? hint;
  final double? dropdownButtonPaddingLeft;
  final double? dropdownButtonPaddingRight;
  final double? dropdownArrowSize;
  final List<DropdownMenuItem<String>>? items;
  final Color? borderSideColor;
  final double? borderWidth;
  final double? borderRadius;
  final Function(bool)? onMenuStateChange;
  final bool iconRotationTransition;
  const CommonDropdownButton(
    {Key? key,
    this.height,
    this.width,
    required this.selectedDropdownValue,
    required this.allDropdownValue,
    required this.onChanged,
    this.buttonBackgroundColor,
    this.dropdownBackgroundColor,
    this.dropdownFontSize,
    this.dropdownListFontSize,
    this.dropdownOptionsSize,
    this.padding,
    this.hint,
    this.items,
    this.dropdownButtonPaddingLeft,
    this.dropdownButtonPaddingRight,
    this.dropdownArrowSize,
    this.borderSideColor,
    this.borderWidth,
    this.borderRadius,
    required this.onMenuStateChange,
    required this.iconRotationTransition,
    })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: hint ?? Text(
          selectedDropdownValue,
          style: TextStyle(
            fontSize: dropdownFontSize ?? 13.5,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: const Color(0xFF008037),
          ),
          overflow: TextOverflow.ellipsis,
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
        onMenuStateChange: onMenuStateChange,
        buttonStyleData: ButtonStyleData(
          height: height ?? 35,
          width: width ?? 120,
          padding: padding ?? EdgeInsets.only(left: dropdownButtonPaddingLeft ?? 8, right: dropdownButtonPaddingRight ?? 8),
          decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(
              //     // color: Colors.grey.withOpacity(0.5),
              //     color: Colors.grey.withOpacity(0.0),
              //     spreadRadius: 0.5,
              //     blurRadius: 3,
              //     offset: const Offset(0, 2), // changes position of shadow
              // ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: -3.5,
                blurRadius: 8.5,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            border: Border.all(
              width: borderWidth ?? 0,
              color: borderSideColor ?? Colors.transparent,
            ),
            color: buttonBackgroundColor ?? const Color(0xFFEAECFF),
          ),
          elevation: 2,
        ),
        iconStyleData: IconStyleData(
          icon: AnimatedRotation(
            turns: iconRotationTransition ? 0.5 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF008037),
            ),
          ),
          iconSize: dropdownArrowSize ?? 24,
          // iconEnabledColor: Colors.yellow,
          // iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          // maxHeight: 200,
          // width: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: -2.5,
                blurRadius: 8.5,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: dropdownBackgroundColor ?? const Color(0xFFEAECFF),
          ),
          offset: const Offset(0, 0),
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