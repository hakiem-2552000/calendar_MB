import 'package:calendar/models/calendar_event.dart';
import 'package:calendar/utils/app_text_style.dart';
import 'package:calendar/utils/colors.dart';
import 'package:calendar/widgets/small_card_event.dart';
import 'package:calendar/widgets/web_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LargeCalendarDayBuilder extends StatelessWidget {
  final Widget widget;

  LargeCalendarDayBuilder({required this.widget});

  factory LargeCalendarDayBuilder.dowBuilder({required DateTime day}) {
    final text = DateFormat('EE', 'en').format(day);

    return LargeCalendarDayBuilder(
      widget: Center(
        child: Text(
          text.toUpperCase(),
          style: AppTextStyle.disableTextStyle(),
        ),
      ),
    );
  }

  factory LargeCalendarDayBuilder.todayBuilder({
    required DateTime day,
    required List<CalendarEvent> events,
  }) {
    return LargeCalendarDayBuilder(
      widget: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: GREY_COLOR),
            color: DARK_BLUE_COLOR,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Text(
                  day.day.toString(),
                  style: AppTextStyle.defaultTextStyle()
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: events
                          .map(
                            (event) => GestureDetector(
                              onTap: () {
                                if (event.link != null) {
                                  Get.to(
                                    WebViewWidget(
                                        title: event.title, url: event.link!),
                                  );
                                }
                              },
                              child: SmallCardEvent(event: event),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  factory LargeCalendarDayBuilder.eventDayBuilder({
    required DateTime day,
    required List<CalendarEvent> events,
  }) {
    return LargeCalendarDayBuilder(
      widget: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: OLD_LACE_COLOR,
            border: Border.all(width: 1, color: GREY_COLOR),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Text(
                  day.day.toString(),
                  style: AppTextStyle.defaultTextStyle(),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: events
                          .map(
                            (event) => GestureDetector(
                              onTap: () {
                                if (event.link != null) {
                                  Get.to(
                                    WebViewWidget(
                                        title: event.title, url: event.link!),
                                  );
                                }
                              },
                              child: SmallCardEvent(event: event),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  factory LargeCalendarDayBuilder.defaultDayBuilder({required DateTime day}) {
    return LargeCalendarDayBuilder(
      widget: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: GREY_COLOR),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Text(
                  day.day.toString(),
                  style: AppTextStyle.defaultTextStyle(),
                ),
              ],
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
