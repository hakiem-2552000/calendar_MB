import 'package:calendar/screens/calendar/calendar_view_model.dart';
import 'package:get/get.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalendarViewModel());
  }
}
