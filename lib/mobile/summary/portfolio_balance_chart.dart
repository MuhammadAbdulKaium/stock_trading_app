import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:stock_trading_app/controller/summary_controller.dart';

class PortfolioBalanceChart extends StatelessWidget {
  const PortfolioBalanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    final SummaryController summaryController = Get.put(SummaryController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // print(screenHeight);
    // print(screenWidth);

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(),
        ),
        Expanded(
          flex: 105,
          child: Card(
            color: const Color(0xFFF4FCF7),
            semanticContainer: false,
            surfaceTintColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.035),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.015, left: screenWidth * 0.015, right: screenWidth * 0.035),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Portfolio Balance',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9291A5),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // SizedBox(height: screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '৳',
                                  style: TextStyle(
                                    fontSize: 14.5.sp,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF008037),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  summaryController.portfolioBalance.value.toString(),
                                  style: TextStyle(
                                    fontSize: 14.5.sp,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF008037),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: screenWidth * 0.0090,
                                      backgroundColor: const Color(0xFF008037),
                                      child: Container(),
                                    ),
                                    SizedBox(width: screenWidth * 0.0124),
                                    Text(
                                      'X',
                                      style: TextStyle(
                                        fontSize: 10.0.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF615E83),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: screenWidth * 0.0455),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: screenWidth * 0.0090,
                                      backgroundColor: const Color(0xFFACE330),
                                      child: Container(),
                                    ),
                                    SizedBox(width: screenWidth * 0.0124),
                                    Text(
                                      'Y',
                                      style: TextStyle(
                                        fontSize: 10.0.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF615E83),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01842),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.015),
                    child: SizedBox(
                      height: screenHeight * 0.23026, // Specify a fixed height
                      child: GetBuilder<SummaryController>(
                        builder: (_) {
                          return LineChart(
                            LineChartData(
                              gridData: gridData,
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: screenHeight * 0.0368421,
                                    interval: 1,
                                    getTitlesWidget: bottomTitlesWidget
                                  ),
                                ),
                                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    getTitlesWidget: leftTitlesWidget,
                                    showTitles: true,
                                    interval: 50000,
                                    reservedSize: screenWidth * 0.097222
                                  ),
                                ),
                              ), 
                              borderData: borderData,
                              // minX: 0,
                              // maxX: 14,
                              // minY: 0,
                              // maxY: 4,
                              lineBarsData: [
                                LineChartBarData(
                                  isCurved: true,
                                  color: const Color(0xFF008037),
                                  barWidth: 2.2,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                    show: false,
                                    color: const Color(0xFF008037).withOpacity(0.3),
                                  ),
                                  spots: summaryController.xDataPoints,
                                ),
                                LineChartBarData(
                                  isCurved: true,
                                  color: const Color(0xFFACE330),
                                  barWidth: 2.2,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                    show: false,
                                    color: const Color(0xFFACE330).withOpacity(0.3),
                                  ),
                                  spots: summaryController.yDataPoints,
                                ),
                              ],
                            )
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
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

Widget leftTitlesWidget(double value, TitleMeta meta) {
  final style = TextStyle(
    fontSize: 10.4.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: const Color(0xFF615E83),
    overflow: TextOverflow.ellipsis,
  );
  String text;
  switch (value.toInt()){
    case 0:
      text = '0';
      break;
    case 50000:
      text = '50k';
      break;
    case 100000:
      text = '100k';
      break;
    case 150000:
      text = '150k';
      break;
    case 200000:
      text = '200k';
      break;
    case 250000:
      text = '250k';
      break;
    case 300000:
      text = '300k';
      break;
    case 350000:
      text = '350k';
      break;
    case 400000:
      text = '400k';
      break;
    case 450000:
      text = '450k';
      break;
    case 500000:
      text = '500k';
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.center,);
}

Widget bottomTitlesWidget(double value, TitleMeta meta) {
  final style = TextStyle(
    fontSize: 9.4.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: const Color(0xFF615E83),
    overflow: TextOverflow.ellipsis,
  );
  Widget text;
  switch (value.toInt()){
    case 0:
      text = Text('Jan', style: style,);
      break;
    case 1:
      text = Text('Feb', style: style,);
      break;
    case 2:
      text = Text('Mar', style: style,);
      break;
    case 3:
      text = Text('Apr', style: style,);
      break;
    case 4:
      text = Text('May', style: style,);
      break;
    case 5:
      text = Text('Jun', style: style,);
      break;
    default:
      return const Text('');
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

FlGridData get gridData => const FlGridData(show: true,drawHorizontalLine: true,);

FlBorderData get borderData => FlBorderData(
  show: true,
  border: const Border(
    bottom: BorderSide(color: Color(0xFFE5E5EF),width: 2,),
    left: BorderSide(color: Color(0xFFE5E5EF)),
    right: BorderSide(color: Colors.transparent),
    top: BorderSide(color: Colors.transparent),
  )
);
