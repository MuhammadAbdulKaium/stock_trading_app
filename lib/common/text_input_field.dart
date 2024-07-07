import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  // final TextEditingController controller;
  final FormFieldValidator validator;
  final bool obsecure;
  final bool readOnly;
  // final VoidCallback onTap;
  // final VoidCallback onEditingCompleted;
  final TextInputType keyboardType;
  final dynamic onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String hintText;
  // final String errorText;
  // final String label;
  final Widget? suffix;
  final dynamic controller;
  final FocusNode? focusNode;
  // final TextEditingController? controller;
  // final Widget prefix;
  final dynamic style;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final bool? filled;
  final Color? fillColor;
  final bool isDense;
  final TextStyle? errorStyle;
  final BoxConstraints? suffixIconConstraints;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final int? maxLength;
  final TextAlign? textAlign;
  final dynamic onFieldSubmitted;
  final dynamic onTap;
  final String? prefixText;
  const TextInputField(
      {Key? key,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      // this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      // this.errorText,
      // @required this.label,
      this.suffix,
      // this.suffix = const IconButton(icon: Icon(null), onPressed: null),
      // this.prefix,
      this.enabled = true,
      this.hintText = '',
      // this.onEditingCompleted,
      this.controller,
      this.focusNode,
      this.onChanged,
      this.style,
      this.contentPaddingVertical,
      this.contentPaddingHorizontal,
      this.filled,
      this.fillColor,
      this.isDense = false,
      this.errorStyle,
      this.suffixIconConstraints,
      this.hintStyle,
      this.enabledBorder,
      this.maxLength,
      this.textAlign,
      this.onFieldSubmitted,
      this.onTap,
      this.prefixText,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        controller: controller,
        focusNode: focusNode,
        // onEditingComplete: onEditingCompleted,
        autofocus: autofocus,
        minLines: isMulti ? 4 : 1,
        maxLines: isMulti ? null : 1,
        maxLength: maxLength,
        textAlign: textAlign ?? TextAlign.start,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        enabled: enabled,
        readOnly: readOnly,
        obscureText: obsecure,
        keyboardType: keyboardType,
        style: style ?? const TextStyle(),
        // controller: controller,
        // style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black,),
        decoration: InputDecoration(
          prefixText: prefixText ?? '',
          isDense: isDense,
          filled: filled ?? false,
          fillColor: fillColor ?? Colors.white,
          // errorText: errorText,
          errorStyle: errorStyle ?? const TextStyle(fontSize: 11, fontFamily: 'Gilroy',),
          // prefixIcon: prefix,
          suffixIcon: suffix,
          suffixIconConstraints: suffixIconConstraints ?? const BoxConstraints(),
          // labelStyle: TextStyle(fontSize: lableFontSize()),
          // labelText: 'Email Address',
          hintStyle: hintStyle ?? const TextStyle(color: Color.fromARGB(255, 105, 105, 105), fontFamily: 'Gilroy', fontSize: 15, fontWeight: FontWeight.w500),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: contentPaddingVertical ?? 10, horizontal: contentPaddingHorizontal ?? 10),
          enabledBorder: enabledBorder ?? const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(61, 70, 70, 70), width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF008037), width: 1.0,),
            borderRadius: BorderRadius.all(Radius.circular(8),),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF008037), width: 1.0,),
            borderRadius: BorderRadius.all(Radius.circular(8),),
          ),
          // errorBorder: errorrTextFieldBorder(),
          // focusedErrorBorder: errorrTextFieldBorder(),
        ),
        validator: validator);
  }
}






















// import 'package:flutter/material.dart';

// class EmailInputField extends StatelessWidget {
//   const EmailInputField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: signInController.validateEmail,
//       keyboardType: TextInputType.emailAddress,
//       autofocus: false,
//       style: const TextStyle(
//         fontWeight: FontWeight.normal,
//         color: Colors.black,
//       ),
//       decoration: const InputDecoration(
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 10,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color.fromARGB(61, 70, 70, 70),
//             width: 0.8,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(8),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF5D5FEF),
//             width: 0.8,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(7),
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF5D5FEF),
//             width: 0.8,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(7),
//           ),
//         ),
//         hintText: 'Email Address',
//       ),
//       validator: (value) {
//         signInController.validateEmail;
//         // print(signInController.isValidEmail);
//         if (value == null ||
//             value.isEmpty ||
//             !signInController.isValidEmail.value) {
//           return 'Enter a valid email address';
//         }
//         return null;
//       },
//     );
//   }
// }
