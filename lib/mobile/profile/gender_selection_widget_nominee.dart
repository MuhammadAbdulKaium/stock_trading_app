import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/nominee_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class GenderSelectionWidgetNominee extends StatelessWidget {
  const GenderSelectionWidgetNominee({super.key});

  @override
  Widget build(BuildContext context) {
    final NomineeController nomineeController = Get.put(NomineeController());
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ChoiceChip(
                label: Row(
                  children: [
                    Icon(CustomIcons.male, 
                      color: nomineeController.selectedGender.value == 'Male' 
                      ? Colors.white : const Color(0xFF008037),
                      size: screenWidth * 0.065,
                    ),
                    SizedBox(width: screenWidth * 0.0125),
                    Text('Male',
                      style: TextStyle(
                        fontSize: 13.47.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        // color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                selected: nomineeController.selectedGender.value == 'Male',
                onSelected: (bool selected) {
                  nomineeController.selectGender(selected ? 'Male' : null);
                },
                selectedColor: const Color(0xFF008037),
                backgroundColor: const Color(0xFFF4FCF7),
                labelStyle: TextStyle(
                  color: nomineeController.selectedGender.value == 'Male' 
                  ? Colors.white : const Color(0xFF008037),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Color(0xFF008037)),
                ),
              ),
              SizedBox(width: screenWidth * 0.048611),
              ChoiceChip(
                label: Row(
                  children: [
                    Icon(CustomIcons.female, 
                      color: nomineeController.selectedGender.value == 'Female' 
                      ? Colors.white : const Color(0xFF008037),
                      size: screenWidth * 0.065,
                    ),
                    SizedBox(width: screenWidth * 0.0125),
                    Text('Female',
                      style: TextStyle(
                        fontSize: 13.47.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        // color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                selected: nomineeController.selectedGender.value == 'Female',
                onSelected: (bool selected) {
                  nomineeController.selectGender(selected ? 'Female' : null);
                },
                selectedColor: const Color(0xFF008037),
                backgroundColor: const Color(0xFFF4FCF7),
                labelStyle: TextStyle(
                  color: nomineeController.selectedGender.value == 'Female' 
                  ? Colors.white : const Color(0xFF008037),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Color(0xFF008037)),
                ),
              ),
            ],
          ),
          nomineeController.isGenderInvalid.isTrue ? const Padding(
            padding: EdgeInsets.only(top: 0.5, left: 8),
            child: Text(
              'Select your Gender',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.red, 
                fontSize: 11,
              ),
            ),
          ) : Container(),
        ],
      );
    });
  }
}