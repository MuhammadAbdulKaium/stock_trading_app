class EventModel {
  String? eventId;
  String? title;
  String? details;
  DateTime? startDate;
  DateTime? endDate;

EventModel({
  required this.eventId,
  required this.title,
  required this.details,
  required this.startDate,
  required this.endDate,
});
}