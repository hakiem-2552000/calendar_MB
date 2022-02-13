import 'package:calendar/base/base_view_model.dart';
import 'package:calendar/mock_data/mock_data.dart';
import 'package:calendar/models/calendar_event.dart';
import 'package:calendar/service/data_validator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rxdart/rxdart.dart';

class CalendarViewModel extends BaseViewModel {
  var focusDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;
  final selectedEvents = BehaviorSubject<List<CalendarEvent>>();
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

  void onDaySelected(DateTime day, DateTime focusDay) {
    selectedDay.value = day;
    List<CalendarEvent> list = [];
    listEvent.value.forEach((event) {
      if (DataValidator.isSameDay(event.day, day)) {
        list.add(event);
      }
    });
    selectedEvents.add(list);
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
}
