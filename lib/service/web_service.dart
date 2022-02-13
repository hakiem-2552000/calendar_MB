import 'package:calendar/models/base_api_response.dart';
import 'package:calendar/utils/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:rxdart/rxdart.dart';

class WebService extends GetxService {
  static const String X_SECRET_KEY = 'X-SECRET-KEY';

  final needLogout = BehaviorSubject<String>();
  final dio = Dio();

  @override
  void onInit() {
    super.onInit();
    // getFlavorSettings().then((settings) => {
    //       dio.options.baseUrl = settings.apiBaseUrl,
    //       dio.options.connectTimeout = 60000,
    //     });
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    }
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // try {
        //   String? token = await sharedPreferenceService.getDataStorage(
        //       key: DataStorageType.access_token.path);

        //   options.headers['Authorization'] = 'Bearer $token';
        //   options.headers[X_SECRET_KEY] =
        //       (await getFlavorSettings()).xSecretKey;
        // } on Exception {
        //   return handler.reject(DioError(
        //       requestOptions: options,
        //       error: Failure('BACKEND_GENERAL_ERROR_MESSAGE'.tr)));
        // }
        // return handler.next(options);
      },
      onResponse: (Response response, handler) {
        BaseAPIResponse baseResponse = BaseAPIResponse.fromJson(response.data);
        if ([401, 402, 403].contains(baseResponse.code)) {
          needLogout.add('INVALID_AUTHENTICATION_ERROR_MESSAGE'.tr);
          return handler.reject(DioError(
              requestOptions: response.requestOptions,
              error: Failure('BACKEND_GENERAL_ERROR_MESSAGE'.tr)));
        } else {
          Response newResponse = Response(
            requestOptions: response.requestOptions,
            data: baseResponse,
          );
          return handler.next(newResponse);
        }
      },
      onError: (DioError e, handler) {
        return handler.next(DioError(
            requestOptions: e.requestOptions,
            error: Failure('BACKEND_GENERAL_ERROR_MESSAGE'.tr)));
      },
    ));
  }

  @override
  void onClose() {
    needLogout.close();
    super.onClose();
  }
}

enum APIRoute {
  register,
}

extension APIRouteExtention on APIRoute {
  String get path {
    switch (this) {
      case APIRoute.register:
        return '/register';
    }
  }
}
