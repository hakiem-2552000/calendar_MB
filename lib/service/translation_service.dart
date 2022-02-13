import 'dart:ui';

import 'package:calendar/utils/localize_vn.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static final fallbackLocale = Locale('vn');

  @override
  Map<String, Map<String, String>> get keys => {
        'vn': VN,
      };
}
