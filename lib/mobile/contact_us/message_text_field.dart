import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/contact_us_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactUsController contactUsController = Get.find<ContactUsController>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE4E4E7), width: 0.9),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Formatting Icons Row
          Row(
            children: [
              SizedBox(
                height: screenWidth * 0.0825,
                width: screenWidth * 0.0825,
                child: Obx(() => IconButton(
                  icon: const Icon(CustomIcons.bold),
                  iconSize: screenWidth * 0.0425,
                  padding: const EdgeInsets.all(0),
                  onPressed: contactUsController.toggleBold,
                  color: contactUsController.isBold.value ? Colors.black : const Color(0xFF71717A),
                )),
              ),
              SizedBox(
                height: screenWidth * 0.0825,
                width: screenWidth * 0.0825,
                child: Obx(() => IconButton(
                  icon: const Icon(CustomIcons.italic),
                  iconSize: screenWidth * 0.0425,
                  padding: const EdgeInsets.all(0),
                  onPressed: contactUsController.toggleItalic,
                  color: contactUsController.isItalic.value ? Colors.black : const Color(0xFF71717A),
                )),
              ),
              SizedBox(
                height: screenWidth * 0.0825,
                width: screenWidth * 0.0825,
                child: IconButton(
                  icon: const Icon(CustomIcons.image),
                  iconSize: screenWidth * 0.0425,
                  padding: const EdgeInsets.all(0),
                  onPressed: contactUsController.insertImage,
                  color: const Color(0xFF71717A),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Divider(
                    height: 0,
                    thickness: 0.8,
                    color: Color.fromARGB(255, 214, 214, 214),
                  ),
                ),
              )
            ],
          ),
          // Text Input Field
          Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.5),
            child: TextFormField(
              initialValue: contactUsController.inputText.value,
              onChanged: (value) => contactUsController.inputText.value = value,
              keyboardType: TextInputType.emailAddress,
              maxLines: 8, // Allows multiple lines
              style: TextStyle(
                fontSize: 13.1.sp,
                color: const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: contactUsController.isBold.value ? FontWeight.bold : FontWeight.w500,
                fontStyle: contactUsController.isItalic.value ? FontStyle.italic : FontStyle.normal,
              ),
              decoration: InputDecoration(
                hintText: 'Text',
                hintStyle: TextStyle(
                  color: const Color(0xFFA1A1AA), 
                  fontFamily: 'Gilroy', 
                  fontSize: 13.1.sp, 
                  fontWeight: FontWeight.w500
                ),
                border: InputBorder.none,
              ),
            ),
          )),
          // Display Inserted Image Below Text Field
          Obx(() {
            if (contactUsController.insertedImage.value != null) {
              return SizedBox(
                height: screenHeight * 0.08,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.file(File(contactUsController.insertedImage.value!.path)),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}