import 'package:calendar/models/calendar_event.dart';
import 'package:calendar/screens/calendar/calendar_view_model.dart';
import 'package:calendar/service/data_convert.dart';
import 'package:calendar/utils/app_text_style.dart';
import 'package:calendar/utils/colors.dart';
import 'package:calendar/utils/constants.dart';
import 'package:calendar/widgets/calender_day_widget.dart';
import 'package:calendar/widgets/card_event.dart';
import 'package:calendar/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  final calendarVM = Get.find<CalendarViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SKY_BLUE_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => _buildCalendar()),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: LineWidget(),
              ),
              SizedBox(height: 10),
              Obx(() => _buildSelectedDay()),
              SizedBox(height: 10),
              Expanded(child: _buildListEvent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    final _focusDay = calendarVM.focusDay.value;
    final _selectedDay = calendarVM.selectedDay.value;
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
                  headerVisible: false,
                  onDaySelected: calendarVM.onDaySelected,
                  selectedDayPredicate: (day) {
                    if (day == _selectedDay) {
                      return true;
                    }
                    return false;
                  },
                  holidayPredicate: (day) {
                    return calendarVM.hasEvent(day);
                  },
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) =>
                        CalendarDayBuilder.dowBuilder(day: day),
                    todayBuilder: (context, day, focusDay) =>
                        CalendarDayBuilder.todayBuilder(day: day),
                    selectedBuilder: (context, day, focusDay) =>
                        CalendarDayBuilder.selectedBuilder(day: day),
                    holidayBuilder: (context, day, focusDay) =>
                        CalendarDayBuilder.eventDayBuilder(day: day),
                  ),
                  onPageChanged: calendarVM.onPageChanged,
                ),
              ],
            );
          }
          return Container();
        });
  }

  Widget _buildListEvent() {
    return SingleChildScrollView(
      child: StreamBuilder<List<CalendarEvent>>(
        stream: calendarVM.selectedEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final events = snapshot.data!;
            if (events.isEmpty) {
              return Container();
            }
            return Column(
              children: events
                  .map(
                    (event) => Column(
                      children: [
                        CardEvent(event: event),
                        SizedBox(height: 8),
                      ],
                    ),
                  )
                  .toList(),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong...'));
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSelectedDay() {
    final _selectedDay = calendarVM.selectedDay.value;
    String formattedDate = _selectedDay.day.toString() +
        ', ' +
        DataConvert.getNameOfMonth(_selectedDay) +
        ' ' +
        _selectedDay.year.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            'Upcoming Events',
            style: AppTextStyle.titleTextStyle(),
          ),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            formattedDate,
            style: AppTextStyle.disableTextStyle(),
          ),
        ),
      ],
    );
  }
}
