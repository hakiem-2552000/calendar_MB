import 'package:calendar/screens/root/root_view_model.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootViewModel());
  }
}
