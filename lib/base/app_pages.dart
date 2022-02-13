import 'package:calendar/screens/calendar/calendar_binding.dart';
import 'package:calendar/screens/calendar/calendar_screen.dart';
import 'package:calendar/screens/large_calendar/large_calendar_binding.dart';
import 'package:calendar/screens/large_calendar/large_calendar_screen.dart';
import 'package:calendar/screens/root/root_binding.dart';
import 'package:calendar/screens/root/root_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => RootScreen(),
      binding: RootBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.CALENDAR,
      page: () => CalendarScreen(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: Routes.LARGE_CALENDAR,
      page: () => LargeCalendarScreen(),
      binding: LargeCalendarBinding(),
    ),
  ];
}
