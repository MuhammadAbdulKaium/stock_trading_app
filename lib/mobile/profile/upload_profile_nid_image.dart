import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock_trading_app/controller/personal_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

final PersonalController personalController = Get.put(PersonalController());

class UploadProfileNidImage extends StatelessWidget {
  const UploadProfileNidImage({super.key});

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    personalController.pickNidFileFromDevice();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  personalController.pickNidImageFromCamera(source: ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final PersonalController personalController = Get.put(PersonalController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Obx(() {
          if (personalController.selectedNidFile.value == null) {
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
                    _showImagePickerOptions(context);
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