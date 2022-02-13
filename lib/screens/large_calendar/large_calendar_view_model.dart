import 'package:calendar/base/base_view_model.dart';
import 'package:calendar/mock_data/mock_data.dart';
import 'package:calendar/models/calendar_event.dart';
import 'package:calendar/service/data_validator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rxdart/rxdart.dart';

class LargeCalendarViewModel extends BaseViewModel {
  var focusDay = DateTime.now().obs;
  final listEvent = BehaviorSubject<List<CalendarEvent>>();

  @override
  void onInit() {
    super.onInit();
    getListEvent();
  }

  void getListEvent() {
    listEvent.add(mockData);
  }

  void onPageChanged(DateTime day) {
    focusDay.value = day;
  }

  bool hasEvent(DateTime day) {
    bool check = false;
    if (listEvent.hasValue) {
      listEvent.value.forEach((event) {
        if (DataValidator.isSameDay(event.day, day)) {
          check = true;
        }
      });
    }
    return check;
  }

  List<CalendarEvent> getEventsOfDay(DateTime day) {
    List<CalendarEvent> list = [];
    listEvent.value.forEach((event) {
      if (DataValidator.isSameDay(event.day, day)) {
        list.add(event);
      }
    });
    return list;
  }
}
