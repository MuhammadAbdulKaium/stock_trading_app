import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/common/text_input_field.dart';
import 'package:stock_trading_app/controller/cash_out_controller.dart';

final CashOutController cashOutController = Get.put(CashOutController());

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> cashOutFormkey = GlobalKey<FormState>();

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container()
        ),
        Expanded(
          flex: 100,
          child: Form(
            key: cashOutFormkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enter Amount',
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.0091,),
                TextInputField(
                  textAlign: TextAlign.center,
                  controller: TextEditingController(
                    text: cashOutController.enterAmount.isNotEmpty 
                    ? '৳${cashOutController.enterAmount.value.toString()}'
                    : ''
                  ),
                  onChanged: cashOutController.updateEnterAmount,
                  keyboardType: TextInputType.number,
                  hintText: '৳0',
                  hintStyle: TextStyle(
                    fontSize: 19.sp,
                    color: const Color(0xFFA1A1AA),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: TextStyle(
                    fontSize: 19.sp,
                    color: const Color(0xFF52525B),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10.sp, 
                    fontFamily: 'Gilroy',
                    height: 0.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF4FCF7),
                  contentPaddingVertical: screenHeight * 0.0108,
                  contentPaddingHorizontal: 10,
                  validator: (value) {
                    final regex = RegExp(r'^\d*\.?\d*$');
                    final amount = num.tryParse(value);
          
                    cashOutController.updateEnterAmount;
          
                    if (value.trim().isEmpty) {
                      return 'Amount cannot be empty.';
                    } else if (amount == null || amount <= 0) {
                      return 'Enter a valid amount.';
                    } else if (!regex.hasMatch(value.trim())) {
                      return 'Enter a valid amount.';
                    } else if (cashOutController.withdrawableBalance.value < amount) {
                      return 'Insufficient balance.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.04265,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Bank Details',
                      style: TextStyle(
                        fontSize: 17.3.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1D192B),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.017,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Bank Name',
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.009,),
                TextInputField(
                  controller: TextEditingController(text: cashOutController.bankName.value),
                  onChanged: cashOutController.updateBankName,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Bank Name',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFA1A1AA),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF191414),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10.sp, 
                    fontFamily: 'Gilroy',
                    height: 0.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF4FCF7),
                  contentPaddingVertical: screenHeight * 0.0143,
                  contentPaddingHorizontal: 10,
                  validator: (value) {
                    final validBankNameRegex = RegExp(r"^[a-zA-Z\s\.\,\-'’]+$");
                    cashOutController.updateBankName;

                    if (value.isEmpty) {
                      return 'Bank Name cannot be empty.';
                    } else if (!validBankNameRegex.hasMatch(value)) {
                      return 'Enter a valid Bank Name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.0227,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Branch Name',
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.009,),
                TextInputField(
                  controller: TextEditingController(text: cashOutController.branchName.value),
                  onChanged: cashOutController.updateBranchName,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Branch Name',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFA1A1AA),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF191414),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10.sp, 
                    fontFamily: 'Gilroy',
                    height: 0.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF4FCF7),
                  contentPaddingVertical: screenHeight * 0.0143,
                  contentPaddingHorizontal: 10,
                  validator: (value) {
                    final validNameRegex = RegExp(r"^[a-zA-Z\s\.\,\-'’]+$");
                    cashOutController.updateBranchName;

                    if (value.isEmpty) {
                      return 'Branch Name cannot be empty.';
                    } else if (!validNameRegex.hasMatch(value)) {
                      return 'Enter a valid Branch Name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.0227,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Account Holder Name',
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.009,),
                TextInputField(
                  controller: TextEditingController(text: cashOutController.accountHolderName.value),
                  onChanged: cashOutController.updateAccountHolderName,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Account Holder Name',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFA1A1AA),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF191414),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10.sp, 
                    fontFamily: 'Gilroy',
                    height: 0.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF4FCF7),
                  contentPaddingVertical: screenHeight * 0.0143,
                  contentPaddingHorizontal: 10,
                  validator: (value) {
                    final validNameRegex = RegExp(r"^[a-zA-Z\s\.\,\-'’]+$");
                    cashOutController.updateBranchName;

                    if (value.isEmpty) {
                      return 'Account Holder Name cannot be empty.';
                    } else if (!validNameRegex.hasMatch(value)) {
                      return 'Enter a valid Account Holder Name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.0227,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Account Number',
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.009,),
                TextInputField(
                  controller: TextEditingController(text: cashOutController.accountNumber.value),
                  onChanged: cashOutController.updateAccountNumber,
                  keyboardType: TextInputType.number,
                  hintText: 'Enter Account Number',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFA1A1AA),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF191414),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10.sp, 
                    fontFamily: 'Gilroy',
                    height: 0.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF4FCF7),
                  contentPaddingVertical: screenHeight * 0.0143,
                  contentPaddingHorizontal: 10,
                  validator: (value) {
                    final validNameRegex = RegExp(r'^\d{1,17}$');
                    cashOutController.updateAccountNumber;

                    if (value.isEmpty) {
                      return 'Account Number cannot be empty.';
                    } else if (!validNameRegex.hasMatch(value.trim())) {
                      return 'Enter a valid Account Number.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.0227,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Routing Number',
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF27272A),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.009,),
                TextInputField(
                  controller: TextEditingController(text: cashOutController.routingNumber.value),
                  onChanged: cashOutController.updateRoutingNumber,
                  keyboardType: TextInputType.number,
                  hintText: 'Enter Routing Number',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFA1A1AA),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF191414),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10.sp, 
                    fontFamily: 'Gilroy',
                    height: 0.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(159, 226, 224, 224), width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF4FCF7),
                  contentPaddingVertical: screenHeight * 0.0143,
                  contentPaddingHorizontal: 10,
                  validator: (value) {
                    final validNameRegex = RegExp(r'^\d{9}$');
                    cashOutController.updateRoutingNumber;

                    if (value.isEmpty) {
                      return 'Routing Number cannot be empty.';
                    } else if (!validNameRegex.hasMatch(value.trim())) {
                      return 'Enter valid Routing Number.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.0425,),
                SizedBox(
                  width: double.maxFinite,
                  height: screenHeight * 0.045,
                  child: CommonButton(
                    borderRadius: 8,
                    backgroundColor: const Color(0xFF008037),
                    child: Text('Withdraw',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onPressed: () {
                      if (cashOutFormkey.currentState!.validate()) {
                        Get.dialog(
                          CustomAlartDialog(
                            end: -0.03,
                            horizontalPadding: screenWidth * 0.041666,
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            closeIcon: Padding(
                              padding: EdgeInsets.only(right: screenWidth * 0.03, top: screenWidth * 0.0215),
                              child: Icon(
                                Icons.close,
                                color: const Color(0xFF71717A),
                                size: screenWidth * 0.06,
                              ),
                            ),
                            onClose: () {
                              Future.delayed(const Duration(milliseconds: 300), 
                                () {
                                  // signInAndSignUpController.toggleSignInSignUp();
                                  // signInAndSignUpController.onClose();
                                }
                              );
                            },
                            dialogContent: Padding(
                              padding: const EdgeInsets.only(left: 18, right: 18),
                              child: Column(
                                children: [
                                  SizedBox(height: screenHeight * 0.005,),
                                  Text(
                                    'Confirm your Withdraw Request. After confirmation, our team will transfer it to your Bank account very shortly.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 12.65.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF52525B),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0242,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.19,
                                        height: screenHeight * 0.038,
                                        child: CommonButton(
                                          borderRadius: 8,
                                          backgroundColor: const Color(0xFF008037),
                                          child: Text('Confirm',
                                            style: TextStyle(
                                              fontSize: 11.5.sp,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          onPressed: () {
                                            
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.0192,),
                                ],
                              ),
                            ),
                          ),
                          // barrierDismissible: false,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.0327,),
              ],
            ),
          )
        ),
        Expanded(
          flex: 5,
          child: Container()
        ),
      ],
    );
  }
}