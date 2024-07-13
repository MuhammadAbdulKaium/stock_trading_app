import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/progress_page_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderProgressBar extends StatelessWidget {
  const OrderProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgressPageController progressPageController = Get.put(ProgressPageController());
    ScreenUtil.init(context, designSize: const Size(411.42857142857144, 868.5714285714286));
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define breakpoints
    double progressPercentagePosition;
    double orderTimelinePosition;
    if (screenHeight >= 896) {
      progressPercentagePosition = screenHeight * 0.098;
      orderTimelinePosition = screenHeight * 0.2;
    } else if (screenHeight >= 844) {
      progressPercentagePosition = screenHeight * 0.114;
      orderTimelinePosition = screenHeight * 0.2;
    } else if (screenHeight >= 800) {
      progressPercentagePosition = screenHeight * 0.1375;
      orderTimelinePosition = screenHeight * 0.2;
    } else if (screenHeight >= 780) {
      progressPercentagePosition = screenHeight * 0.145;
      orderTimelinePosition = screenHeight * 0.2;
    } else {
      progressPercentagePosition = screenHeight * 0.2;
      orderTimelinePosition = screenHeight * 0.2;
    }
    
    return  Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Obx(() {
                    return SizedBox(
                      width: screenWidth * 0.7,
                      // height: screenWidth * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                startAngle: 180,
                                endAngle: 0,
                                minimum: 0,
                                maximum: 100,
                                showLabels: false,
                                showTicks: false,
                                axisLineStyle: const AxisLineStyle(
                                  thickness: 0.15,
                                  cornerStyle: CornerStyle.bothCurve,
                                  thicknessUnit: GaugeSizeUnit.factor,
                                  color: Color(0xFFF4FCF7),
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: progressPageController.progressValue.value,
                                    cornerStyle: CornerStyle.bothCurve,
                                    width: 0.15,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    color: const Color(0xFF008037),
                                  ),
                                  MarkerPointer(
                                    value: progressPageController.progressValue.value,
                                    markerType: MarkerType.circle,
                                    color: const Color(0xFF008037),
                                    borderWidth: 3.35,
                                    borderColor: Colors.white,
                                    markerOffset: 0,
                                    markerWidth: 30, // Set the width of the marker
                                    markerHeight: 30, // Set the height of the marker
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(progressPercentagePosition),
                  left: screenWidth / 3,
                  child: SizedBox(
                    width: screenWidth / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('${progressPageController.progressValue.value.toInt()}%',
                              style: TextStyle(
                                fontSize: 46.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF1D192B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text('Order Timeline',
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF008037),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
                Expanded(
                  flex: 100,
                  child: Container(
                    padding: EdgeInsets.only(left: screenWidth * 0.057, right: screenWidth * 0.046296296296, top: screenWidth * 0.043, bottom: screenWidth * 0.046296296296,),
                    margin: EdgeInsets.only(bottom: screenWidth * 0.046296296296,),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4FCF7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.0045,),
                          child: Text('Order Timeline',
                            style: TextStyle(
                              fontSize: 17.0.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1D192B),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(height:  screenHeight * 0.021,),
                        Obx(() {
                          return Column(
                            children: progressPageController.timelineData.asMap().entries.map((entry) {
                              int index = entry.key;
                              var item = entry.value;
                              bool isFirst = index == 0;
                              bool isLast = index == progressPageController.timelineData.length - 1;
                              return TimelineTile(
                                alignment: TimelineAlign.start,
                                isFirst: isFirst,
                                isLast: isLast,
                                indicatorStyle: IndicatorStyle(
                                  width: 17.4,
                                  indicator: Container(
                                    width: 17.4,
                                    height: 17.4,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF008037),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 1.37),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                                          spreadRadius: 0, // The spread radius of the shadow
                                          blurRadius: 1, // The blur radius of the shadow
                                          offset: const Offset(0, 1), // The offset of the shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                  indicatorXY: 0.0975,
                                ),
                                endChild: Padding(
                                  padding: EdgeInsets.only(left: screenWidth * 0.037,),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['date']!,
                                        style: TextStyle(
                                          fontSize: 16.0.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF1D192B),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height:  screenHeight * 0.0185,),
                                      Text(
                                        item['time']!,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF1D192B),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height:  screenHeight * 0.0035,),
                                      Text(
                                        item['event']!,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF52525B),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height:  screenHeight * 0.0035,),
                                      Text(
                                        item['note']!,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF52525B),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      isLast ? Container() : SizedBox(height:  screenHeight * 0.029,),
                                    ],
                                  ),
                                ),
                                beforeLineStyle: const LineStyle(
                                  color: Color(0xFF008037),
                                  thickness: 2,
                                ),
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ),
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
        // Positioned(
        //   top: ScreenUtil().setHeight(orderTimelinePosition),
        //   left: 0,
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04545454545454545454545454545455),
        //     child: Container(
        //       width: screenWidth * 0.9090909090909090909090909090909,
        //       padding: EdgeInsets.only(left: screenWidth * 0.057, right: screenWidth * 0.046296296296, top: screenWidth * 0.043, bottom: screenWidth * 0.046296296296,),
        //       margin: EdgeInsets.only(bottom: screenWidth * 0.046296296296,),
        //       decoration: BoxDecoration(
        //         color: const Color(0xFFF4FCF7),
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //       child: SingleChildScrollView(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Padding(
        //               padding: EdgeInsets.only(left: screenWidth * 0.0045,),
        //               child: Text('Order Timeline',
        //                 style: TextStyle(
        //                   fontSize: 17.0.sp,
        //                   fontFamily: 'Poppins',
        //                   fontWeight: FontWeight.w600,
        //                   color: const Color(0xFF1D192B),
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //               ),
        //             ),
        //             SizedBox(height:  screenHeight * 0.021,),
        //             Obx(() {
        //               return Column(
        //                 children: progressPageController.timelineData.asMap().entries.map((entry) {
        //                   int index = entry.key;
        //                   var item = entry.value;
        //                   bool isFirst = index == 0;
        //                   bool isLast = index == progressPageController.timelineData.length - 1;
        //                   return TimelineTile(
        //                     alignment: TimelineAlign.start,
        //                     isFirst: isFirst,
        //                     isLast: isLast,
        //                     indicatorStyle: IndicatorStyle(
        //                       width: 17.4,
        //                       indicator: Container(
        //                         width: 17.4,
        //                         height: 17.4,
        //                         decoration: BoxDecoration(
        //                           color: const Color(0xFF008037),
        //                           shape: BoxShape.circle,
        //                           border: Border.all(color: Colors.white, width: 1.37),
        //                           boxShadow: [
        //                             BoxShadow(
        //                               color: Colors.black.withOpacity(0.2), // Shadow color with opacity
        //                               spreadRadius: 0, // The spread radius of the shadow
        //                               blurRadius: 1, // The blur radius of the shadow
        //                               offset: const Offset(0, 1), // The offset of the shadow
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       indicatorXY: 0.0975,
        //                     ),
        //                     endChild: Padding(
        //                       padding: EdgeInsets.only(left: screenWidth * 0.037,),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             item['date']!,
        //                             style: TextStyle(
        //                               fontSize: 16.0.sp,
        //                               fontFamily: 'Poppins',
        //                               fontWeight: FontWeight.w600,
        //                               color: const Color(0xFF1D192B),
        //                               overflow: TextOverflow.ellipsis,
        //                             ),
        //                           ),
        //                           SizedBox(height:  screenHeight * 0.0185,),
        //                           Text(
        //                             item['time']!,
        //                             style: TextStyle(
        //                               fontSize: 13.sp,
        //                               fontFamily: 'Poppins',
        //                               fontWeight: FontWeight.w600,
        //                               color: const Color(0xFF1D192B),
        //                               overflow: TextOverflow.ellipsis,
        //                             ),
        //                           ),
        //                           SizedBox(height:  screenHeight * 0.0035,),
        //                           Text(
        //                             item['event']!,
        //                             style: TextStyle(
        //                               fontSize: 13.sp,
        //                               fontFamily: 'Poppins',
        //                               fontWeight: FontWeight.w500,
        //                               color: const Color(0xFF52525B),
        //                               overflow: TextOverflow.ellipsis,
        //                             ),
        //                           ),
        //                           SizedBox(height:  screenHeight * 0.0035,),
        //                           Text(
        //                             item['note']!,
        //                             style: TextStyle(
        //                               fontSize: 13.sp,
        //                               fontFamily: 'Poppins',
        //                               fontWeight: FontWeight.w400,
        //                               color: const Color(0xFF52525B),
        //                               overflow: TextOverflow.ellipsis,
        //                             ),
        //                           ),
        //                           isLast ? Container() : SizedBox(height:  screenHeight * 0.029,),
        //                         ],
        //                       ),
        //                     ),
        //                     beforeLineStyle: const LineStyle(
        //                       color: Color(0xFF008037),
        //                       thickness: 2,
        //                     ),
        //                   );
        //                 }).toList(),
        //               );
        //             }),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}