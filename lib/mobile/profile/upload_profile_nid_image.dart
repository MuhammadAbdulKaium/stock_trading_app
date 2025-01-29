import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock_trading_app/controller/personal_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

// final PersonalController personalController = Get.find<PersonalController>();

class UploadProfileNidImage extends StatelessWidget {
  const UploadProfileNidImage({super.key});

  void _showImagePickerOptions(BuildContext context) {
    final PersonalController personalController = Get.find<PersonalController>();
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
    final PersonalController personalController = Get.find<PersonalController>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Obx(() {
          // Check if there's an NID image from API or locally selected image
          if (personalController.selectedNidFile.value != null) {
            // Locally selected image
            String filePath = personalController.selectedNidFile.value!.path;
            String fileExtension = filePath.split('.').last.toLowerCase();
            return _buildSelectedNidFileView(screenWidth, fileExtension);
          } else if (personalController.nidPicturePathFromApi.isNotEmpty && personalController.selectedNidFile.value == null) {
            // NID image from API
            return _buildApiNidImageView(screenWidth, personalController.nidPicturePathFromApi.value);
          } else {
            // No image, show upload option
            return _buildUploadButton(screenWidth, screenHeight, context);
          }
        }),

        Obx(() {
          return !personalController.isNidFileSelected.value && personalController.nidPicturePathFromApi.value.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Text(
                      'NID Required.',
                      style: TextStyle(
                        fontSize: 10.3.sp,
                        color: const Color(0xFFB3261E),
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            : Container();
        }),
      ],
    );
  }

  Widget _buildUploadButton(double screenWidth, double screenHeight, BuildContext context) {
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
  }

  Widget _buildSelectedNidFileView(double screenWidth, String fileExtension) {
    final PersonalController personalController = Get.find<PersonalController>();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF4FCF7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.65),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              dashPattern: const [5, 4.0],
              borderPadding: const EdgeInsets.all(0),
              color: const Color(0xFF008037),
              strokeWidth: 1.0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenWidth * 0.012,
                  bottom: screenWidth * 0.012,
                  left: fileExtension == 'pdf' ? 0 : screenWidth * 0.012,
                  right: screenWidth * 0.0155,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'png') ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          personalController.selectedNidFile.value!,
                          height: screenWidth * 0.07 * 2,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.015),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: screenWidth * 0.005, right: screenWidth * 0.04),
                              child: Text(
                                personalController.nidFileName.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 13.15.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1D192B),
                                ),
                              ),
                            ),
                            Text(
                              '${personalController.nidFileSize.value.toStringAsFixed(3)} MB',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.15.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFA1A1AA),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else if (fileExtension == 'pdf') ...[
                      SizedBox(
                        height: screenWidth * 0.07 * 2,
                        child: Image.asset(
                          'images/pdf-logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: screenWidth * 0.005, right: screenWidth * 0.04),
                              child: Text(
                                personalController.nidFileName.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 13.15.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1D192B),
                                ),
                              ),
                            ),
                            Text(
                              '${personalController.nidFileSize.value.toStringAsFixed(3)} MB',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.15.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFA1A1AA),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Unsupported file format',
                        style: TextStyle(
                          fontSize: 13.15.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ],
                ),
              )
            ),
          ),
        ),
        Positioned(
          top: screenWidth * 0.02,
          right: screenWidth * 0.02,
          child: GestureDetector(
            onTap: () {
              personalController.selectedNidFile.value = null;
              personalController.nidPicturePathFromApi.value = '';
            },
            child: CircleAvatar(
              radius: screenWidth * 0.023,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                size: screenWidth * 0.032,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildApiNidImageView(double screenWidth, String imageUrl) {
    final PersonalController personalController = Get.find<PersonalController>();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF4FCF7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.65),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              dashPattern: const [5, 4.0],
              borderPadding: const EdgeInsets.all(0),
              color: const Color(0xFF008037),
              strokeWidth: 1.0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenWidth * 0.012,
                  bottom: screenWidth * 0.012,
                  left: screenWidth * 0.012,
                  right: screenWidth * 0.0155,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        height: screenWidth * 0.07 * 2,  // Adjust based on your layout
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
        Positioned(
          top: screenWidth * 0.02,
          right: screenWidth * 0.02,
          child: GestureDetector(
            onTap: () {
              personalController.selectedNidFile.value = null;
              personalController.nidPicturePathFromApi.value = '';
            },
            child: CircleAvatar(
              radius: screenWidth * 0.023,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                size: screenWidth * 0.032,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}