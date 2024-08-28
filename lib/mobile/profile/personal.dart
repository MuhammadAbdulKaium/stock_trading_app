import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/personal_controller.dart';
import 'package:stock_trading_app/controller/profile_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/profile/gender_selection_widget.dart';
import 'package:stock_trading_app/mobile/profile/upload_profile_nid_image.dart';
// import 'package:stock_trading_app/mobile/profile/date_picker_form_field.dart';

final ProfileController profileController = Get.put(ProfileController());
final PersonalController personalController = Get.put(PersonalController());

class Personal extends StatelessWidget {
  const Personal({super.key});

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
                    personalController.pickImage(source: ImageSource.gallery);
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  personalController.pickImage(source: ImageSource.camera);
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> personalDetailsFormkey = GlobalKey<FormState>();
    
    return Form(
      key: personalDetailsFormkey,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.0495,),
          Obx(() {
            return Stack(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.11861,
                  // backgroundColor: Colors.white,
                  backgroundImage: personalController.selectedImage.value != null 
                  ? FileImage(personalController.selectedImage.value!) 
                  : const AssetImage('images/blank_profile_picture.jpg') as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      _showImagePickerOptions(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Color(0xFFC4C4C4),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.009722),
                      child: Icon(
                        Icons.camera_alt,
                        // color: Colors.black,
                        color: const Color.fromARGB(255, 121, 121, 121),
                        size: screenWidth * 0.0486111,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: screenHeight * 0.0315,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.00454,),
          Obx(() { 
            return TextInputField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: personalController.fullName.value,
                  selection: TextSelection.collapsed(offset: personalController.fullName.value.length),
                ),
              ),
              onChanged: personalController.updateFullName,
              keyboardType: TextInputType.name,
              hintText: 'Enter Your Full Name',
              hintStyle: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFFA1A1AA),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              style: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              errorStyle: TextStyle(
                fontSize: 10.sp, 
                fontFamily: 'Gilroy',
                height: 0.5,
                overflow: TextOverflow.ellipsis,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA1A1AA), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              filled: true,
              fillColor: const Color(0xFFF4FCF7),
              contentPaddingVertical: screenHeight * 0.011,
              contentPaddingHorizontal: screenWidth * 0.0243055,
              validator: (value) {
                final validBankNameRegex = RegExp(r"^[a-zA-Z\s\.\,\-'’]+$");
                personalController.updateFullName;
        
                if (value.isEmpty) {
                  return 'Name cannot be empty.';
                } else if (!validBankNameRegex.hasMatch(value)) {
                  return 'Enter a valid Name.';
                }
                return null;
              },
            );
          }),

          SizedBox(height: screenHeight * 0.039,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.00454,),
          Obx(() { 
            return TextInputField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: personalController.email.value,
                  selection: TextSelection.collapsed(offset: personalController.email.value.length),
                ),
              ),
              onChanged: personalController.validateEmail,
              keyboardType: TextInputType.name,
              hintText: 'Enter Your Email',
              hintStyle: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFFA1A1AA),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              style: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              errorStyle: TextStyle(
                fontSize: 10.sp, 
                fontFamily: 'Gilroy',
                height: 0.5,
                overflow: TextOverflow.ellipsis,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA1A1AA), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              filled: true,
              fillColor: const Color(0xFFF4FCF7),
              contentPaddingVertical: screenHeight * 0.011,
              contentPaddingHorizontal: screenWidth * 0.0243055,
              validator: (value) {
                personalController.validateEmail;
        
                if (value.isEmpty) {
                  return 'Email cannot be empty.';
                } else if (!GetUtils.isEmail(value.trim())) {
                  return 'Enter a valid Email.';
                }
                return null;
              },
            );
          }),

          SizedBox(height: screenHeight * 0.039,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'NID Number',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.00454,),
          Obx(() { 
            return TextInputField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: personalController.nidNumber.value,
                  selection: TextSelection.collapsed(offset: personalController.nidNumber.value.length),
                ),
              ),
              onChanged: personalController.updateAccountNumber,
              keyboardType: TextInputType.name,
              hintText: 'Enter Your NID Number',
              hintStyle: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFFA1A1AA),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              style: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              errorStyle: TextStyle(
                fontSize: 10.sp, 
                fontFamily: 'Gilroy',
                height: 0.5,
                overflow: TextOverflow.ellipsis,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA1A1AA), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              filled: true,
              fillColor: const Color(0xFFF4FCF7),
              contentPaddingVertical: screenHeight * 0.011,
              contentPaddingHorizontal: screenWidth * 0.0243055,
              validator: (value) {
                final validNameRegex = RegExp(r'^\d{10,17}$');
                personalController.updateAccountNumber;
        
                if (value.isEmpty) {
                  return 'NID Number cannot be empty.';
                } else if (!validNameRegex.hasMatch(value.trim())) {
                  return 'Enter a valid NID Number.';
                }
                return null;
              },
            );
          }),

          SizedBox(height: screenHeight * 0.039,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'NID Image',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.0075,),
          const UploadProfileNidImage(),

          SizedBox(height: screenHeight * 0.039,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Gender',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.0075,),
          const GenderSelectionWidget(),

          SizedBox(height: screenHeight * 0.03604,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Date of birth',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.00454,),
          Obx(() { 
            return TextInputField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: personalController.dateOfBirth.value == null ? '00/00/0000' : personalController.formattedDate,
                  selection: TextSelection.collapsed(offset: personalController.formattedDate.length),
                ),
              ),
              readOnly: true,
              // onChanged: personalController.selectDate(context),
              // keyboardType: TextInputType.name,
              hintText: personalController.dateOfBirth.value == null ? 'Select Your DOB' : '',
              hintStyle: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFFA1A1AA),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              style: TextStyle(
                fontSize: 13.405.sp,
                color: personalController.dateOfBirth.value == null ? const Color(0xFFA1A1AA) : const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              errorStyle: TextStyle(
                fontSize: 10.sp, 
                fontFamily: 'Gilroy',
                height: 0.5,
                overflow: TextOverflow.ellipsis,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA1A1AA), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              filled: true,
              fillColor: const Color(0xFFF4FCF7),
              contentPaddingVertical: screenHeight * 0.011,
              contentPaddingHorizontal: screenWidth * 0.0243055,
              suffix: Padding(
                padding: const EdgeInsets.only(right: 3),
                child: SizedBox(
                  height: screenWidth * 0.1,
                  width: screenWidth * 0.1,
                  child: Icon(CustomIcons.calendarEdit, 
                    size: screenWidth * 0.062,
                    color: const Color(0xFFA1A1AA),
                  ),
                ),
              ),
              suffixIconConstraints: BoxConstraints(maxHeight: screenWidth * 0.085069, maxWidth: screenWidth * 0.0972222),
              onTap: () => personalController.selectDate(context),
              validator: (value) {
                // final validNameRegex = RegExp(r'^\d{10,17}$');
                // personalController.selectDate(context);
                    
                if (personalController.dateOfBirth.value == null) {
                  return 'DOB required.';
                }
                return null;
              },
            );
          }),

          SizedBox(height: screenHeight * 0.039,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.00454,),
          SizedBox(
            height: 53.sp,
            child: IntlPhoneField(
              controller: personalController.phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  fontSize: 13.405.sp,
                  color: const Color(0xFFA1A1AA),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFA1A1AA), width: 1.0), // Default border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA1A1AA), width: 1.0), // Border when enabled
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF008037), width: 1.0), // Border when focused
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0), // Border when error
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent, width: 1.0), // Border when focused and error
                  borderRadius: BorderRadius.circular(8.0),
                ),
                isDense: false,
                filled: true,
                fillColor: const Color(0xFFF4FCF7),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0.sp,
                  horizontal: screenWidth * 0.0243055,
                ),
              ),
              dropdownTextStyle: TextStyle(
                fontSize: 13.405.sp,
                // color: const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              style: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              initialCountryCode: 'BD', // Default country code
              onChanged: (phone) {
                personalController.updatePhoneNumber(phone);
                // print(phone.completeNumber); // The complete number including the country code
              },
              validator: (value) {
                final validNameRegex = RegExp(r'^\d+$');
                personalController.updatePhoneNumber;
        
                if (value!.number.isEmpty) {
                  return 'Phone Number cannot be empty.';
                } else if (!validNameRegex.hasMatch(value.number.trim())) {
                  return 'Enter a valid Phone Number.';
                }
                return null;
              },
            ),
          ),

          SizedBox(height: screenHeight * 0.019,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 13.405.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF27272A),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.00454,),
          Obx(() { 
            return TextInputField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: personalController.address.value,
                  selection: TextSelection.collapsed(offset: personalController.address.value.length),
                ),
              ),
              onChanged: personalController.updateAddress,
              keyboardType: TextInputType.name,
              hintText: 'Enter Your Address',
              minLines: 2,
              maxLines: 3,
              hintStyle: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFFA1A1AA),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              style: TextStyle(
                fontSize: 13.405.sp,
                color: const Color(0xFF191414),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              errorStyle: TextStyle(
                fontSize: 10.sp, 
                fontFamily: 'Gilroy',
                height: 0.5,
                overflow: TextOverflow.ellipsis,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA1A1AA), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              filled: true,
              fillColor: const Color(0xFFF4FCF7),
              contentPaddingVertical: screenHeight * 0.011,
              contentPaddingHorizontal: screenWidth * 0.0243055,
              validator: (value) {
                personalController.updateAddress;
        
                if (value.isEmpty) {
                  return 'Address required';
                } 
                return null;
              },
            );
          }),

          SizedBox(height: screenHeight * 0.0495,),
          SizedBox(
              width: double.maxFinite,
              height: screenHeight * 0.05035,
              child: Obx(() { 
            return CommonButton(
                borderRadius: 8,
                backgroundColor: personalController.isAnyFieldChanged.value ? const Color(0xFF008037) : const Color.fromARGB(255, 116, 146, 129),
                onPressed: personalController.isAnyFieldChanged.value 
                ? () {
                  if (personalDetailsFormkey.currentState!.validate() && personalController.validateGender()) {
                    // paymentProofController.uploadFile();
                  }
                }
                : null,
                child: Text('Save',
                  style: TextStyle(
                    fontSize: 14.75.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              );
          }),
            )
        ],
      ),
    );
  }
}