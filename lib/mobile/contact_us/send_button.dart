import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/controller/contact_us_controller.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactUsController contactUsController = Get.find<ContactUsController>();
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.03),
      child: SizedBox(
        width: double.maxFinite,
        height: screenHeight * 0.05035,
        child: Obx(() { 
          return CommonButton(
            borderRadius: 8,
            backgroundColor: contactUsController.isAnyFieldChanged.value ? const Color(0xFF008037) : const Color.fromARGB(255, 116, 146, 129),
            onPressed: contactUsController.isAnyFieldChanged.value 
            ? () {
              contactUsController.inputText.value.isNotEmpty ? contactUsController.sendMessage() : null;
            }
            : null,
            child: Text('Send',
              style: TextStyle(
                fontSize: 14.75.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            )
          );
        }),
      ),
    );
  }
}