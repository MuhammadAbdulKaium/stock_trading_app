import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_trading_app/controller/summary_controller.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({super.key});

  @override
  Widget build(BuildContext context) {
    final SummaryController summaryController = Get.put(SummaryController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(),
        ),
        Expanded(
          flex: 105,
          child: Obx(() => 
            Column(
              children: summaryController.transactionSummaryList.map((transactionSummary) =>
                Card(
                  color: const Color(0xFFF4FCF7), 
                  semanticContainer: false,
                  surfaceTintColor: Colors.white,
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: screenWidth * 0.045,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.0425, bottom: screenWidth * 0.0425, left: screenWidth * 0.0325, right: screenWidth * 0.0325),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product Name',
                                    style: TextStyle(
                                      fontSize: 11.7.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0049,),
                                  Padding(
                                    padding: EdgeInsets.only(right: screenWidth * 0.0325),
                                    child: Text(
                                      transactionSummary.productName ?? '',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14.5.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1D192B),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 32,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Start Date',
                                    style: TextStyle(
                                      fontSize: 11.7.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0049,),
                                  Text(
                                    DateFormat('dd/MM/yy').format(transactionSummary.startDate!),
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1D192B),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 28,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Quantity',
                                    style: TextStyle(
                                      fontSize: 11.7.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0049,),
                                  Text(
                                    transactionSummary.quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1D192B),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Purchase Price',
                                    style: TextStyle(
                                      fontSize: 11.7.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0049,),
                                  Padding(
                                    padding: EdgeInsets.only(right: screenWidth * 0.0325),
                                    child: Text(
                                      '${transactionSummary.purchasePrice.toString()} BDT',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14.5.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1D192B),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 32,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sell Price',
                                    style: TextStyle(
                                      fontSize: 11.7.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0049,),
                                  Text(
                                    '${transactionSummary.sellPrice.toString()} BDT',
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1D192B),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 28,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Quantity',
                                    style: TextStyle(
                                      fontSize: 11.7.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF008037),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.0049,),
                                  Text(
                                    '${transactionSummary.purchasePrice.toString()} BDT',
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1D192B),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(),
        ),
      ],
    );
  }
}