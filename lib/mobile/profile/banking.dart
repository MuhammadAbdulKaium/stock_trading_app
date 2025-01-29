import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/banking_controller.dart';
import 'package:stock_trading_app/models/bank_details_model.dart';

class Banking extends StatelessWidget {
  const Banking({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> bankingDetailsFormkey = GlobalKey<FormState>();
    // final BankingController bankingController = Get.put(BankingController());
    final BankingController bankingController = Get.find<BankingController>();

    return SingleChildScrollView(
      child: Form(
        key: bankingDetailsFormkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.033 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Bank Name',
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
                  controller: bankingController.bankNameController.value,
                  onChanged: bankingController.updateBankName,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Bank Name',
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
                    bankingController.updateBankName;
            
                    if (value.isEmpty) {
                      return 'Bank Name cannot be empty.';
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Enter valid Bank Name.';
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
                    'Branch Name',
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
                  controller: bankingController.branchNameController.value,
                  onChanged: bankingController.updateBranchName,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Branch Name',
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
                    final validBankNameRegex = RegExp(r"^[a-zA-Z0-9\s\.\-']+$");
                    bankingController.updateBranchName;
            
                    if (value.isEmpty) {
                      return 'Branch Name cannot be empty.';
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Enter valid Branch Name.';
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
                    'Account Holder Name',
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
                  controller: bankingController.accountHolderNameController.value,
                  onChanged: bankingController.updateAccountHolderName,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Account Holder Name',
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
                    final validBankNameRegex = RegExp(r"^[a-zA-Z0-9\s\.\-']+$");
                    bankingController.updateAccountHolderName;
            
                    if (value.isEmpty) {
                      return 'Account Holder Name cannot be empty.';
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Enter valid Account Holder Name.';
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
                    'Account Number',
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
                  controller: bankingController.accountNumberController.value,
                  onChanged: bankingController.updateAccountNumber,
                  keyboardType: TextInputType.number,
                  hintText: 'Enter Account Number',
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
                    final validBankNameRegex = RegExp(r'^\d{1,17}$');
                    bankingController.updateAccountNumber;
            
                    if (value.isEmpty) {
                      return 'Account Number cannot be empty.';
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Enter valid Account Number.';
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
                    'Routing Number',
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
                  controller: bankingController.routingNumberController.value,
                  onChanged: bankingController.updateRoutingNumber,
                  keyboardType: TextInputType.number,
                  hintText: 'Enter Routing Number',
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
                    final validBankNameRegex = RegExp(r'^\d{9}$');
                    bankingController.updateRoutingNumber;
            
                    if (value.isEmpty) {
                      return 'Routing Number cannot be empty.';
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Enter valid Routing Number.';
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
                    backgroundColor: bankingController.isAnyFieldChanged.value ? const Color(0xFF008037) : const Color.fromARGB(255, 116, 146, 129),
                    onPressed: bankingController.isAnyFieldChanged.value 
                    ? () {
                      if (bankingDetailsFormkey.currentState!.validate()) {
                        BankDetailsModel? updatedDetails = BankDetailsModel(
                          bankName: bankingController.bankNameController.value.text.trim(),
                          branchName: bankingController.branchNameController.value.text.trim(),
                          accountHolderName: bankingController.accountHolderNameController.value.text.trim(),
                          accountNumber: bankingController.accountNumberController.value.text.trim(), // Keep other fields unchanged
                          routingNumber: bankingController.routingNumberController.value.text.trim(),
                        );
      
                        bankingController.updateBankDetails(updatedDetails);
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