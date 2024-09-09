import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/common/custom_alart_dialog.dart';
import 'package:stock_trading_app/common/custom_check_box.dart';
import 'package:stock_trading_app/controller/booking_page_controller.dart';
import 'package:stock_trading_app/controller/confirmation_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class BookingBasicInfo extends StatelessWidget {
  const BookingBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingPageController bookingPageController = Get.put(BookingPageController());
    final ConfirmationController confirmationController = Get.put(ConfirmationController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(),
            ),
            Expanded(
              flex: 98,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Munafa Bank Details',
                        style: TextStyle(
                          fontSize: 21.6.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0465,),
                  Row(
                    children: [
                      Text('Bank Name',
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.007,),
                  Row(
                    children: [
                      Text(bookingPageController.bankDetails.value.bankName!,
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0305,),
                  Row(
                    children: [
                      Text('Branch Name',
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.007,),
                  Row(
                    children: [
                      Text(bookingPageController.bankDetails.value.branchName!,
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0305,),
                  Row(
                    children: [
                      Text('Account Name',
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.007,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bookingPageController.bankDetails.value.accountHolderName!,
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Obx(() => 
                        GestureDetector(
                          onTapDown: (_) {
                            bookingPageController.toggleAccountNameCopyIcon(true);
                          },
                          onTapUp: (_) {
                            bookingPageController.toggleAccountNameCopyIcon(false);
                            bookingPageController.copyToClipboard(bookingPageController.bankDetails.value.accountHolderName!, "'Account Name'");
                          },
                          onTapCancel: () {
                            bookingPageController.toggleAccountNameCopyIcon(false);
                          },
                          child: Icon(
                            bookingPageController.isAccountNameCopied.value ? CustomIcons.copyFilled : CustomIcons.copyOutline2,
                            size: screenWidth * 0.065,
                            color: const Color(0xFF008037),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0305,),
                  Row(
                    children: [
                      Text('Account Number',
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.007,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bookingPageController.bankDetails.value.accountNumber!,
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Obx(() => 
                        GestureDetector(
                          onTapDown: (_) {
                            bookingPageController.toggleAccountNumberCopyIcon(true);
                          },
                          onTapUp: (_) {
                            bookingPageController.toggleAccountNumberCopyIcon(false);
                            bookingPageController.copyToClipboard(bookingPageController.bankDetails.value.accountNumber!, "'Account Number'");
                          },
                          onTapCancel: () {
                            bookingPageController.toggleAccountNumberCopyIcon(false);
                          },
                          child: Icon(
                            bookingPageController.isAccountNumberCopied.value ? CustomIcons.copyFilled : CustomIcons.copyOutline2,
                            size: screenWidth * 0.065,
                            color: const Color(0xFF008037),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0305,),
                  Row(
                    children: [
                      Text('Routing Number',
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.007,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bookingPageController.bankDetails.value.routingNumber!,
                        style: TextStyle(
                          fontSize: 13.7.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Obx(() => 
                        GestureDetector(
                          onTapDown: (_) {
                            bookingPageController.toggleRoutingNumberCopyIcon(true);
                          },
                          onTapUp: (_) {
                            bookingPageController.toggleRoutingNumberCopyIcon(false);
                            bookingPageController.copyToClipboard(bookingPageController.bankDetails.value.routingNumber!, "'Routing Number'");
                          },
                          onTapCancel: () {
                            bookingPageController.toggleRoutingNumberCopyIcon(false);
                          },
                          child: Icon(
                            bookingPageController.isRoutingNumberCopied.value ? CustomIcons.copyFilled : CustomIcons.copyOutline2,
                            size: screenWidth * 0.065,
                            color: const Color(0xFF008037),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.0493,),
        Container(
          padding: EdgeInsets.only(top: screenHeight * 0.0305, bottom: screenHeight * 0.03,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.0631944)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 98,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Instructions',
                              style: TextStyle(
                                fontSize: 15.4.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1D192B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.007,),
                        Text('Log in to your online banking platform or visit your bank branch. Select the option for a local bank transfer or payment.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D192B),
                            height: 1.65,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.0247,),
                        Row(
                          children: [
                            Text("Enter Munafa's Bank Details",
                              style: TextStyle(
                                fontSize: 15.9.sp,
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
                          children: [
                            Expanded(
                              flex: 45,
                              child: Text('Bank Name:',
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 55,
                              child: Text(bookingPageController.bankDetails.value.bankName!,
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.00879,),
                        Row(
                          children: [
                            Expanded(
                              flex: 45,
                              child: Text('Account Name:',
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 55,
                              child: Text(bookingPageController.bankDetails.value.accountHolderName!,
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.00879,),
                        Row(
                          children: [
                            Expanded(
                              flex: 45,
                              child: Text('Account Number:',
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 55,
                              child: Text(bookingPageController.bankDetails.value.accountNumber!,
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.00879,),
                        Row(
                          children: [
                            Expanded(
                              flex: 45,
                              child: Text('Branch:',
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 55,
                              child: Text(bookingPageController.bankDetails.value.branchName!,
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.00879,),
                        Row(
                          children: [
                            Expanded(
                              flex: 45,
                              child: Text('Routing Number:',
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 55,
                              child: Text(bookingPageController.bankDetails.value.routingNumber!,
                                style: TextStyle(
                                  fontSize: 11.95.sp,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF1D192B),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.0369,),
                        Row(
                          children: [
                            Text('Enter Payment Details',
                              style: TextStyle(
                                fontSize: 15.9.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1D192B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.007,),
                        Text('In the payment reference include your Munafa order ID for quick identification. Confirm and send your payment',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D192B),
                            height: 1.65,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.0375,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => CustomCheckBox(
                                height: 25,
                                width: 24,
                                scale: 0.755,
                                borderColor: const Color(0xFF008037),
                                checkBoxLabelStyle: TextStyle(
                                  fontSize: 12.8.sp, 
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF008037),
                                  fontFamily: 'Gilroy',
                                ),
                                checkBoxLabel: 'I agree with Terms and Conditions',
                                isChecked: bookingPageController.checkedAgreementWithTermsAndCondition.value,
                                onChanged: (bool? value) {
                                  bookingPageController.checkedAgreementWithTermsAndCondition.value = !bookingPageController.checkedAgreementWithTermsAndCondition.value;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.0435,),
                        SizedBox(
                          width: double.maxFinite,
                          height: screenHeight * 0.05035,
                          child: CommonButton(
                            borderRadius: 8,
                            backgroundColor: const Color(0xFF008037),
                            child: Text('Book Now',
                              style: TextStyle(
                                fontSize: 14.75.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            onPressed: () {
                              // confirmationController.loadConfirmationPage();
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
                                  dialogHeader: Padding(
                                    padding: EdgeInsets.only(top: screenHeight * 0.0204,),
                                    child: Text(
                                      'Congratulations!',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14.3.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1D192B),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  dialogContent: Padding(
                                    padding: const EdgeInsets.only(left: 18, right: 18),
                                    child: Column(
                                      children: [
                                        SizedBox(height: screenHeight * 0.0104,),
                                        Row(
                                          children: [
                                            Text(
                                              'Your Booking is confirmed',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 12.65.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF52525B),
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: screenHeight * 0.02,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.135,
                                              height: screenHeight * 0.038,
                                              child: CommonButton(
                                                borderRadius: 8,
                                                backgroundColor: const Color(0xFF008037),
                                                child: Text('OK',
                                                  style: TextStyle(
                                                    fontSize: 11.5.sp,
                                                    fontFamily: 'Gilroy',
                                                    fontWeight: FontWeight.w500,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Get.back();
                                                  confirmationController.loadConfirmationPage();
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
                              // if(buyInfoFormkey.currentState!.validate()) {
                              //   bookingPageController.loadBookingPage();
                              //   Future.delayed(const Duration(milliseconds: 300), () {
                              //     investmentOpportunityDetailsController.resetVariables();
                              //   });
                              // }
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}