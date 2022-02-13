import 'package:calendar/models/calendar_event.dart';
import 'package:calendar/utils/app_text_style.dart';
import 'package:calendar/utils/colors.dart';
import 'package:flutter/material.dart';

class SmallCardEvent extends StatelessWidget {
  final CalendarEvent event;
  SmallCardEvent({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: 20,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: DARK_ORANGE_COLOR,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Align(
        child: Text(
          event.title,
          maxLines: 1,
          style: AppTextStyle.smallTitleTextStyle().copyWith(
            fontSize: 6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
