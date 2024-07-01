// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_trading_app/controller/event_calendar_controller.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:stock_trading_app/helpers/custom_icons.dart';

final EventCalendarController eventCalendarController = Get.put(EventCalendarController());

class EventCalendar extends StatelessWidget {
  const EventCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Event Calendar',
                    style: TextStyle(
                      fontSize: 17.15.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1D192B),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.0110,),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4FCF7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE8E8EA), // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Column(
                  children: [
                    Obx(() => TableCalendar(
                      calendarStyle: const CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: Color(0xFF008037), // Color for selected day
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Color.fromARGB(255, 115, 206, 131), // Color for today's date
                          shape: BoxShape.circle,
                        ),
                      ),
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2035, 12, 31),
                      focusedDay: eventCalendarController.focusedDay.value,
                      selectedDayPredicate: (day) {
                        return isSameDay(eventCalendarController.selectedDay.value, day);
                      },
                      // onDaySelected: eventCalendarController.onDaySelected,
                      onDaySelected: (selectedDay, focusedDay) {
                        eventCalendarController.onDaySelected(selectedDay, focusedDay);
                      },
                      // calendarFormat: CalendarFormat.month,
                      calendarFormat: eventCalendarController.calendarFormat.value,
                      onFormatChanged: eventCalendarController.onFormatChanged,
                      // eventLoader: eventCalendarController.getEventsForDay,
                    )),
                    Obx(() {
                      final events = eventCalendarController.getEventsForDay(eventCalendarController.selectedDay.value);
                      // print('Events---------');
                      // print(events);
                      return events.isNotEmpty ? Column(
                        children: [
                          SizedBox(height: screenHeight * 0.0159,),
                          const Divider(
                            height: 0,
                            thickness: 0.8,
                            color: Color(0xFFE8E8EA),
                          ),
                          SizedBox(height: screenHeight * 0.0050,),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              final event = events[index];
                              bool isStartDateToday = event.startDate == eventCalendarController.normalizeDate(DateTime.now());
                              bool isEndDateToday = event.endDate == eventCalendarController.normalizeDate(DateTime.now());
                              return ListTile(
                                title: Container(
                                  padding: EdgeInsets.all(screenWidth * 0.0340,),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    // border: Border.all(
                                    //   color: Colors.grey, // Adjust the color as needed
                                    //   width: 1, // Adjust the width as needed
                                    // ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event.title!,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF008037),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.0040,),
                                      Text(
                                        event.details!,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF1D192B),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: screenHeight * 0.0050,),
                                    Row(
                                      children: [
                                        Text(isStartDateToday ? 'Today' : DateFormat('EEE, MMM d').format(event.startDate!),
                                          style: TextStyle(
                                            fontSize: 9.5.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF27272A),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(' - ',
                                          style: TextStyle(
                                            fontSize: 9.5.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF27272A),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(isEndDateToday ? 'Today' : DateFormat('EEE, MMM d').format(event.endDate!),
                                          style: TextStyle(
                                            fontSize: 9.5.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF27272A),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.0080,),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ) 
                      : const SizedBox.shrink();
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        )
      ],
    );
  }
}