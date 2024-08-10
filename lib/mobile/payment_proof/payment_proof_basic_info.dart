import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/payment_proof_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class PaymentProofBasicInfo extends StatelessWidget {
  const PaymentProofBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentProofController paymentProofController = Get.put(PaymentProofController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.0235,),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Text(
                'Please Upload Your Payment Proof',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21.6.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF008037),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015,),
          Text("Please provide evidence of your completed transaction to ensure your payment is quickly and accurately processed. Upload a screenshot or photo of your bank transfer receipt, including the transaction ID and date. Once submitted, our team will verify your payment, and you'll receive a confrmation email. This step is crucial for the timely processing of your order.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.0.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1D192B),
              height: 1.85,
            ),
          ),
          SizedBox(height: screenHeight * 0.0375,),
          
          Obx(() {
            if (paymentProofController.selectedFile.value != null) {
              String filePath = paymentProofController.selectedFile.value!.path;
              String fileExtension = filePath.split('.').last.toLowerCase();
              
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFF4FCF7),
                    ),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      dashPattern: const [5, 4.0],
                      borderPadding: const EdgeInsets.all(0),
                      color: const Color(0xFF008037),
                      strokeWidth: 1.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'png') ...[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.033, vertical: screenWidth * 0.03),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  paymentProofController.selectedFile.value!,
                                  height: screenWidth * 0.31,
                                ),
                              ),
                            ),
                            // SizedBox(width: 8.0),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(top: screenWidth * 0.04, right: screenWidth * 0.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      paymentProofController.fileName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 13.15.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1D192B),
                                      ),
                                    ),
                                    Text(
                                      '${paymentProofController.fileSize.value.toStringAsFixed(2)} MB',
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
                            ),
                          ] else if (fileExtension == 'pdf') ...[
                            SizedBox(
                              height: screenWidth * 0.3645833,
                              width: screenWidth * 0.3,
                              child: Image.asset(
                                'images/pdf-logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            // SizedBox(width: 8.0),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(top: screenWidth * 0.04, right: screenWidth * 0.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      paymentProofController.fileName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 13.15.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1D192B),
                                      ),
                                    ),
                                    Text(
                                      '${paymentProofController.fileSize.value.toStringAsFixed(2)} MB',
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
                      )
                    ),
                  ),
                   Positioned(
                    top: screenWidth * 0.03,
                    right: screenWidth * 0.03,
                    child: GestureDetector(
                      onTap: () {
                        paymentProofController.selectedFile.value = null;
                      },
                      child: CircleAvatar(
                        radius: screenWidth * 0.0291666666,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.close,
                          size: screenWidth * 0.03888888,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
          
          Obx(() {
            if (paymentProofController.selectedFile.value == null) {
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
                      paymentProofController.pickFile();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF4FCF7),
                      ),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8),
                        dashPattern: const [5, 4.0],
                        borderPadding: const EdgeInsets.all(0),
                        color: const Color(0xFF008037),
                        strokeWidth: 1.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: screenHeight * 0.0383,),
                                CircleAvatar(
                                  radius: screenWidth * 0.1285,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Icon(CustomIcons.uploadCloud,
                                      size: screenWidth * 0.1287,
                                      color: const Color(0xFF008037),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0215,),
                                RichText(
                                  text: TextSpan(
                                    text: 'Click here ',
                                    style: TextStyle(
                                      fontSize: 13.15.sp,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(text: 'to upload your files.', style: TextStyle(color: Color(0xFF1D192B))),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0057,),
                                Text(
                                  'Max. 5MB | JPG, PNG, PDF',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.15.sp,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFA1A1AA),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0383,),
                              ],
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
