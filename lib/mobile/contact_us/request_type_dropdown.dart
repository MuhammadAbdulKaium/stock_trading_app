import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_dropdown_button.dart';
import 'package:stock_trading_app/controller/contact_us_controller.dart';

class RequestTypeDropdown extends StatelessWidget {
  const RequestTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactUsController contactUsController = Get.find<ContactUsController>();
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Obx(() => 
            CommonDropdownButton(
              padding: EdgeInsets.only(left: screenWidth * 0.022, right: screenWidth * 0.017),
              selectedDropdownValue: contactUsController.selectedRequestType.value,
              allDropdownValue: contactUsController.availableRequestTypeList,
              buttonBackgroundColor: Colors.white,
              dropdownBackgroundColor: Colors.white,
              dropdownFontSize: 14.sp,
              dropdownListFontSize: 14.sp,
              dropdownOptionsSize: 25,
              borderWidth: 1,
              borderSideColor: const Color(0xFFE4E4E7),
              width: screenWidth * 0.40,
              height: screenWidth > 340 ? screenWidth * 0.106 : 35,
              onChanged: (value) {
                contactUsController.changeSelectedRequestType(value!);
              },
              onMenuStateChange: (isOpen) {
                contactUsController.isDropdownOpened.value = isOpen;
              },
              iconRotationTransition: contactUsController.isDropdownOpened.value,
            ),
          )
        ),
      ],
    );
  }
}