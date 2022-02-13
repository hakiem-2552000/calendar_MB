import 'package:calendar/models/calendar_event.dart';
import 'package:calendar/utils/app_text_style.dart';
import 'package:calendar/utils/colors.dart';
import 'package:calendar/widgets/web_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardEvent extends StatelessWidget {
  CardEvent({required this.event});

  final CalendarEvent event;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 120,
        width: double.maxFinite,
        color: DARK_ORANGE_COLOR,
        child: Row(
          children: [
            Container(
              height: double.maxFinite,
              width: 10,
              color: DARK_BLUE_COLOR,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      event.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.smallTitleTextStyle(),
                    ),
                    Text(
                      event.timeStart + ' - ' + event.timeEnd,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.defaultTextStyle().copyWith(
                        color: LIGHT_BLUE_COLOR,
                      ),
                    ),
                    if (event.link != null)
                      GestureDetector(
                        onTap: () {
                          Get.to(() => WebViewWidget(
                              title: event.title, url: event.link!));
                        },
                        child: Text(
                          event.link!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.linkTextStyle(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
