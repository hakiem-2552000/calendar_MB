import 'package:calendar/screens/calendar/calendar_view_model.dart';
import 'package:calendar/screens/large_calendar/large_calendar_view_model.dart';
import 'package:get/get.dart';

class LargeCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LargeCalendarViewModel());
  }
}
