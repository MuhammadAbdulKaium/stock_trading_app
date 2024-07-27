// import 'package:dcl_trading_bot/controller/add_new_pair_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonInputFieldWithIncrementAndDecrement extends StatelessWidget {
  final FormFieldValidator? validator;
  final dynamic onChanged;
  final Color? backgroundColor;
  final bool isFieldClicked;
  final dynamic onTap;
  final dynamic onEditingComplete;
  final dynamic onTapOutside;
  // final bool canGoUp;
  // final bool canGoDown;
  final dynamic initialValue;
  final dynamic incrementButtonOnTap;
  final dynamic decrementButtonOnTap;
  final TextEditingController? controller;
  final double? inputfieldFontSize;
  final EdgeInsets? inputfieldContentPadding;
  final double? incrementArrowSize;
  final double? decrementArrowSize;
  final Color? foregroundColor;
  const CommonInputFieldWithIncrementAndDecrement({
    Key? key,
    this.validator,
    this.backgroundColor,
    this.isFieldClicked = false,
    this.onTap,
    this.onEditingComplete,
    this.onTapOutside,
    // required this.canGoUp,
    // required this.canGoDown,
    this.initialValue,
    this.incrementButtonOnTap,
    this.decrementButtonOnTap,
    this.onChanged,
    this.controller,
    this.inputfieldFontSize,
    this.inputfieldContentPadding,
    this.incrementArrowSize,
    this.decrementArrowSize,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return TextFormField(
      controller: controller,
      // keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onTapOutside: onTapOutside,
      // initialValue: initialValue.toString(),
      style: TextStyle(
        fontSize: inputfieldFontSize ?? 25.5.sp, 
        fontFamily: 'Gilroy', 
        fontWeight: FontWeight.w700, 
        color: foregroundColor ?? const Color(0xFF191414)
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: '0',
        hintStyle: TextStyle(
          fontSize: 25.5.sp,
          color: const Color(0xFFA1A1AA),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        errorStyle: TextStyle(
          fontSize: 10.sp, 
          fontFamily: 'Gilroy',
          height: 0.5,
          overflow: TextOverflow.ellipsis,
        ),
        fillColor: isFieldClicked ? const Color(0xFFF4FCF7) : backgroundColor ?? const Color(0xFFF4FCF7),
        contentPadding: inputfieldContentPadding ?? const EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),

        focusedBorder: OutlineInputBorder(
          // borderSide: const BorderSide(color: Color(0xFF5D5FEF), width: 1),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(8),
        ),

        suffixIconConstraints: BoxConstraints(maxWidth: screenWidth * 0.1871527777),
        suffixIcon: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
          ),
          clipBehavior: Clip.antiAlias,
          // alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Ink(
              decoration: const BoxDecoration(
                color: Color(0xFF008037),  // Background color of the button
              ),
              child: InkWell(
                onTap: incrementButtonOnTap,
                highlightColor: Colors.green.withOpacity(0.4),
                splashColor: Colors.green.withOpacity(0.4),
                child: SizedBox(
                  height: screenWidth * 0.1871527777,
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white, size: decrementArrowSize ?? screenWidth * 0.0729166,)
                  ),
                ),
              ),
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxWidth: screenWidth * 0.1871527777),
        prefixIcon: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            color: Colors.transparent,
            child: Ink(
              decoration: const BoxDecoration(
                color: Color(0xFF008037),  // Background color of the button
              ),
              child: InkWell(
                onTap: decrementButtonOnTap,
                highlightColor: Colors.green.withOpacity(0.4),
                splashColor: Colors.green.withOpacity(0.4),
                child: SizedBox(
                  height: screenWidth * 0.1871527777,
                  child: Center(
                    child: Icon(Icons.remove, color: Colors.white, size: decrementArrowSize ?? screenWidth * 0.0729166,)
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      maxLines: 1,
      onChanged: onChanged,
      // onChanged: (value) {
      //   print(value);
      // },
      validator: validator,
    );
  }
}