import 'package:calendar/utils/failure.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class BaseViewModel extends FullLifeCycleController with FullLifeCycle {
  final isOffline = BehaviorSubject.seeded(false);
  final isLoading = BehaviorSubject.seeded(false);
  final appError = BehaviorSubject<Failure>();
  final nextScreen = BehaviorSubject<String>();

  @override
  void onClose() {
    isOffline.close();
    isLoading.close();
    appError.close();
    nextScreen.close();
    super.onClose();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
