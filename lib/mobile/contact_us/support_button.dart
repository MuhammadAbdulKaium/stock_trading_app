import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/contact_us_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactUsController contactUsController = Get.find<ContactUsController>();
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Obx(
          () => Material(
            color: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                color: const Color(0xFFF4FCF7),
                borderRadius: BorderRadius.circular(11.43),
                border: Border.all(
                  color: const Color(0xFFE8E8EA), // Border color
                  width: 1, // Border width
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(11.43),
                onTap: () {
                  contactUsController.isExpanded.value = !contactUsController.isExpanded.value;
                  Get.toNamed("/support");
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  // width: contactUsController.isExpanded.value ? 105 : screenWidth * 0.1075,
                  width: contactUsController.isExpanded.value ? 92.sp : screenWidth * 0.1075,
                  height: screenWidth * 0.1075,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4FCF7),
                    borderRadius: BorderRadius.circular(11.43),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -2.5,
                        blurRadius: 8.5,
                        offset: const Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.1075,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CustomIcons.personCall,
                              size: screenWidth * 0.0442,
                              color: const Color(0xFF008037),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: AnimatedOpacity(
                          opacity: contactUsController.isExpanded.value ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: AnimatedAlign(
                            alignment: contactUsController.isExpanded.value
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Text(
                              'Support',
                              style: TextStyle(
                                color: const Color(0xFF008037), 
                                fontSize: 10.5.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                // overflow: TextOverflow.ellipsis,
                              ),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}