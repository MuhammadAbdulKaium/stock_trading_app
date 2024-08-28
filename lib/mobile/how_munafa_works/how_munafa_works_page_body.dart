import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/how_munafa_works_controller.dart';
// import 'package:stock_trading_app/helpers/custom_icons.dart';

class HowMunafaWorksPageBody extends StatelessWidget {
  const HowMunafaWorksPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final HowMunafaWorksController howMunafaWorksController = Get.put(HowMunafaWorksController());
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
        child: Column(
          children: howMunafaWorksController.faqItems.value!.map((item) {
            int index = howMunafaWorksController.faqItems.value!.indexOf(item);
            return Card(
              color: item.isExpanded ? const Color(0xFFF2F2F2) : const Color.fromARGB(255, 233, 255, 236),
              shadowColor: Colors.white,
              margin: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: screenWidth * 0.0291666, right: screenWidth * 0.017013889),
                    title: Text(item.question,
                      style: TextStyle(
                        fontSize: 14.1.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF27272A),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: AnimatedRotation(
                      turns: item.isExpanded ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: screenWidth * 0.06,
                        color: const Color(0xFF71717A),
                      ),
                    ),
                    onTap: () {
                      howMunafaWorksController.toggleFAQ(index);
                    },
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: item.isExpanded ? null : 0,
                    padding: EdgeInsets.only(left: screenWidth * 0.038889, right: screenWidth * 0.038889, top: screenWidth * 0.019444, bottom: screenWidth * 0.0255208),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(item.answer, 
                          textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 13.45.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF52525B),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}