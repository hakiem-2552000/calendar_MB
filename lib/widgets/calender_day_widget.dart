import 'package:calendar/utils/app_text_style.dart';
import 'package:calendar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDayBuilder extends StatelessWidget {
  final Widget widget;

  CalendarDayBuilder({required this.widget});

  factory CalendarDayBuilder.dowBuilder({required DateTime day}) {
    final text = DateFormat('EE', 'en').format(day);

    return CalendarDayBuilder(
      widget: Center(
        child: Text(
          text.toUpperCase(),
          style: AppTextStyle.disableTextStyle(),
        ),
      ),
    );
  }

  factory CalendarDayBuilder.todayBuilder({required DateTime day}) {
    return CalendarDayBuilder(
      widget: Center(
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: LIGHT_BLUE_COLOR),
          ),
          child: Align(
            child: Text(
              day.day.toString(),
              style: AppTextStyle.defaultTextStyle(),
            ),
          ),
        ),
      ),
    );
  }

  factory CalendarDayBuilder.selectedBuilder({required DateTime day}) {
    return CalendarDayBuilder(
      widget: Center(
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: DARK_BLUE_COLOR,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Align(
            child: Text(
              day.day.toString(),
              style:
                  AppTextStyle.defaultTextStyle().copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  factory CalendarDayBuilder.eventDayBuilder({required DateTime day}) {
    return CalendarDayBuilder(
      widget: Center(
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: OLD_LACE_COLOR,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Align(
            child: Text(
              day.day.toString(),
              style: AppTextStyle.defaultTextStyle(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }
}
