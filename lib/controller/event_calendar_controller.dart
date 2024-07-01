import 'package:get/get.dart';
import 'package:stock_trading_app/models/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalendarController extends GetxController {
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // Map<DateTime, List<String>> events = {
  //   DateTime(2024, 08, 17): ['Order #0203 Boro Rice Mature', 'Order #0101 will get mature on this date'],
  // }.obs;

  Map<DateTime, List<EventModel>> events = {
    DateTime(2024, 08, 17): [
      EventModel(
        eventId: '#0203',
        title: 'Order #0203 Boro Rice Mature',
        details: 'Order #0101 will get mature on this date',
        startDate: DateTime(2024, 08, 17),
        endDate: DateTime(2024, 08, 27),
      ),
      EventModel(
        eventId: '#0203',
        title: 'Order #0203 Boro Rice Mature',
        details: 'Order #0101 will get mature on this date',
        startDate: DateTime(2024, 08, 17),
        endDate: DateTime(2024, 08, 27),
      ),
    ],
    DateTime(2024, 06, 29): [
      EventModel(
        eventId: '#0203',
        title: 'Order #0203 Boro Rice Mature',
        details: 'Order #0101 will get mature on this date',
        startDate: DateTime(2024, 06, 30),
        endDate: DateTime(2024, 07, 01),
      ),
      EventModel(
        eventId: '#0203',
        title: 'Order #0203 Boro Rice Mature',
        details: 'Order #0101 will get mature on this date 2',
        startDate: DateTime(2024, 07, 01),
        endDate: DateTime(2024, 07, 17),
      ),
    ],
  }.obs;

  // List<String> getEventsForDay(DateTime day) {
  //   // print(normalizeDate(day));
  //   return events[normalizeDate(day)] ?? [];
  // }

  List<EventModel> getEventsForDay(DateTime day) {
    // print('Focused Day from getEventsForDay------');
    // print(normalizeDate(day));
    List<EventModel> eventsForDay = [];
    events.forEach((date, eventList) {
      for (var event in eventList) {
        if (event.startDate!.isBefore(day.add(const Duration(days: 1))) && event.endDate!.isAfter(day.subtract(const Duration(days: 1)))) {
          eventsForDay.add(event);
        }
      }
    });
    return eventsForDay;
  }


  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = selectedDay;
    // this.focusedDay.value = focusedDay;

    // print('Selected Day and Focused Day from onDaySelected------');
    // print(normalizeDate(selectedDay));
    // print(normalizeDate(focusedDay));
    // print('controller Selected Day and Focused Day from onDaySelected------');
    // print(normalizeDate(this.selectedDay.value));
    // print(normalizeDate(this.focusedDay.value));
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat.value = format;
  }
}