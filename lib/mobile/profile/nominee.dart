import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/nominee_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/profile/gender_selection_widget_nominee.dart';
import 'package:stock_trading_app/mobile/profile/upload_nominee_nid_image.dart';
import 'package:stock_trading_app/models/nominee_details_model.dart';

class Nominee extends StatelessWidget {
  const Nominee({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> nomineeDetailsFormkey = GlobalKey<FormState>();
    final NomineeController nomineeController = Get.put(NomineeController());
    
    return SingleChildScrollView(
      child: Form(
        key: nomineeDetailsFormkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.033 ,),
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
                  controller: nomineeController.fullNameController.value,
                  onChanged: nomineeController.updateFullName,
                  keyboardType: TextInputType.name,
                  hintText: "Enter Nominee's Full Name",
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
                    nomineeController.updateFullName;
            
                    if (value.isEmpty) {
                      return "Nominee's Name cannot be empty.";
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Enter valid Name.';
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
                    'Relationship',
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
                  controller: nomineeController.relationshipController.value,
                  onChanged: nomineeController.updateRelationship,
                  keyboardType: TextInputType.name,
                  hintText: "Nominee's Relationship With You",
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
                    nomineeController.updateRelationship;
            
                    if (value.isEmpty) {
                      return "Nominee's Relationship cannot be empty.";
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Invalid';
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
                  controller: nomineeController.nidNumberController.value,
                  onChanged: nomineeController.updateNidNumber,
                  keyboardType: TextInputType.number,
                  hintText: "Enter Nominee's NID Number",
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
                    nomineeController.updateNidNumber;
            
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
              const UploadNomineeNidImage(),
      
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
              const GenderSelectionWidgetNominee(),
      
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
                  controller: nomineeController.emailController.value,
                  onChanged: nomineeController.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter Nominee's Email",
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
                    nomineeController.validateEmail;
            
                    if (value.isEmpty) {
                      return 'Email cannot be empty.';
                    } else if (!GetUtils.isEmail(value.trim())) {
                      return 'Enter a valid Email.';
                    }
                    return null;
                  },
                );
              }),
      
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
                      text: nomineeController.dateOfBirth.value == null ? '00/00/0000' : nomineeController.formattedDate,
                      selection: TextSelection.collapsed(offset: nomineeController.formattedDate.length),
                    ),
                  ),
                  readOnly: true,
                  // onChanged: personalController.selectDate(context),
                  // keyboardType: TextInputType.name,
                  hintText: nomineeController.dateOfBirth.value == null ? 'Select Your DOB' : '',
                  hintStyle: TextStyle(
                    fontSize: 13.405.sp,
                    color: const Color(0xFFA1A1AA),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: TextStyle(
                    fontSize: 13.405.sp,
                    color: nomineeController.dateOfBirth.value == null ? const Color(0xFFA1A1AA) : const Color(0xFF191414),
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
                  contentPaddingHorizontal: screenWidth * 0.024305,
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
                  onTap: () => nomineeController.selectDate(context),
                  validator: (value) {
                    // final validNameRegex = RegExp(r'^\d{10,17}$');
                    // personalController.selectDate(context);
                        
                    if (nomineeController.dateOfBirth.value == null) {
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
                  key: ValueKey(nomineeController.initialCountryCode.value), // Force rebuild on country code change
                  controller: nomineeController.phoneNumberController.value,
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
                  initialCountryCode: nomineeController.initialCountryCode.value, // Default country code
                  onChanged: (phone) {
                    nomineeController.updatePhoneNumber(phone);
                    // print(phone.completeNumber); // The complete number including the country code
                  },
                  validator: (value) {
                    final validNameRegex = RegExp(r'^\d+$');
                    nomineeController.updatePhoneNumber;
            
                    if (value!.number.isEmpty) {
                      return 'Phone Number cannot be empty.';
                    } else if (!validNameRegex.hasMatch(value.number.trim())) {
                      return 'Enter a valid Phone Number.';
                    }
                    return null;
                  },
                ),
              ),
              Obx(() { 
                return Row(
                  children: [
                    nomineeController.isPhoneNumberFieldEmpty.value ? Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 8),
                      child: Text(
                        'Phone Number cannot be empty.',
                        style: TextStyle(
                          fontSize: 10.3.sp,
                          color: const Color(0xFFB3261E),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ) : Container(),
                  ],
                );
              }),
      
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
                  controller: nomineeController.addressController.value,
                  onChanged: nomineeController.updateAddress,
                  keyboardType: TextInputType.streetAddress,
                  hintText: "Enter Nominee's Address",
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
                    nomineeController.updateAddress;
            
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
                    backgroundColor: nomineeController.isAnyFieldChanged.value ? const Color(0xFF008037) : const Color.fromARGB(255, 116, 146, 129),
                    onPressed: nomineeController.isAnyFieldChanged.value 
                    ? () {
                      bool validGender = nomineeController.validateGender();
                      bool validPhoneNumber = nomineeController.isValidPhoneNumber(nomineeController.phoneNumber.value);
                      bool isNidFileSelected = nomineeController.isNidSelected();

                      if (nomineeDetailsFormkey.currentState!.validate() && validGender && validPhoneNumber && isNidFileSelected) {
                        NomineeDetailsModel? updatedDetails = NomineeDetailsModel(
                          fullName: nomineeController.fullNameController.value.text.trim(),
                          relation: nomineeController.relationshipController.value.text.trim(),
                          nid: nomineeController.nidNumberController.value.text.trim(),
                          gender: nomineeController.selectedGender.value,
                          email: nomineeController.emailController.value.text.trim(),
                          // dob: nomineeController.dateOfBirth.value != null ? DateFormat('yyyy-MM-dd HH:mm:ss').format(nomineeController.dateOfBirth.value!) : null,
                          phone: nomineeController.phoneNumber.value,
                          address: nomineeController.addressController.value.text.trim(),
                        );

                        nomineeController.updateNomineeDetails(updatedDetails);
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
              ),
              SizedBox(height: screenHeight * 0.06,),
            ],
          ),
        ),
      ),
    );
  }
}