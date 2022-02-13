class CalendarEvent {
  final String title;
  final DateTime day;
  final String timeStart;
  final String timeEnd;
  final String? link;
  CalendarEvent({
    required this.title,
    required this.day,
    required this.timeStart,
    required this.timeEnd,
    this.link,
  });
}
