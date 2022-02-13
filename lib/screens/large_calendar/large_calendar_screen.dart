import 'package:calendar/models/calendar_event.dart';
import 'package:calendar/screens/calendar/calendar_view_model.dart';
import 'package:calendar/screens/large_calendar/large_calendar_view_model.dart';
import 'package:calendar/service/data_convert.dart';
import 'package:calendar/utils/app_text_style.dart';
import 'package:calendar/utils/colors.dart';
import 'package:calendar/utils/constants.dart';
import 'package:calendar/widgets/calender_day_widget.dart';
import 'package:calendar/widgets/card_event.dart';
import 'package:calendar/widgets/large_calendar_day_widget.dart';
import 'package:calendar/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class LargeCalendarScreen extends StatelessWidget {
  final calendarVM = Get.find<LargeCalendarViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SKY_BLUE_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => _buildCalendar()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    final _focusDay = calendarVM.focusDay.value;
    String formattedDate =
        DataConvert.getNameOfMonth(_focusDay) + ' ' + _focusDay.year.toString();

    return StreamBuilder<List<CalendarEvent>>(
        stream: calendarVM.listEvent,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    formattedDate,
                    style: AppTextStyle.titleTextStyle(),
                  ),
                ),
                SizedBox(height: 10),
                TableCalendar(
                  firstDay: kCalendarDayStart,
                  lastDay: kCalendarDayEnd,
                  focusedDay: _focusDay,
                  rowHeight: 120,
                  headerVisible: false,
                  holidayPredicate: (day) {
                    return calendarVM.hasEvent(day);
                  },
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) =>
                        LargeCalendarDayBuilder.dowBuilder(day: day),
                    todayBuilder: (context, day, focusDay) {
                      final events = calendarVM.getEventsOfDay(day);
                      return LargeCalendarDayBuilder.todayBuilder(
                        day: day,
                        events: events,
                      );
                    },
                    holidayBuilder: (context, day, focusDay) {
                      final events = calendarVM.getEventsOfDay(day);
                      return LargeCalendarDayBuilder.eventDayBuilder(
                        day: day,
                        events: events,
                      );
                    },
                    defaultBuilder: (context, day, focusDay) =>
                        LargeCalendarDayBuilder.defaultDayBuilder(day: day),
                  ),
                  onPageChanged: calendarVM.onPageChanged,
                ),
              ],
            );
          }
          return Container();
        });
  }
}
