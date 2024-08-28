import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/personal_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class UploadProfileNidImage extends StatelessWidget {
  const UploadProfileNidImage({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonalController personalController = Get.put(PersonalController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Obx(() {
          if (personalController.selectedFile.value == null) {
            // String filePath = personalController.selectedFile.value!.path;
            // String fileExtension = filePath.split('.').last.toLowerCase();
            
            return Material(
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4FCF7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE8E8EA), // Border color
                    width: 1, // Border width
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    personalController.pickFile();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      dashPattern: const [5, 4.0],
                      borderPadding: const EdgeInsets.all(0),
                      color: const Color(0xFF008037),
                      strokeWidth: 1.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.012,
                          horizontal: screenWidth * 0.0155,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.07,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: Icon(
                                  CustomIcons.uploadCloud,
                                  size: screenWidth * 0.06435,
                                  color: const Color(0xFF008037),
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Upload your NID Image',
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF008037),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0057),
                                Text(
                                  'Max. 5MB | JPG, PNG, PDF',
                                  style: TextStyle(
                                    fontSize: 11.65.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFA1A1AA),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        }),
      ],
    );
  }
}