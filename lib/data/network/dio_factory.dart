import 'package:advanced_flutter_course/app/app_prefs.dart';
import 'package:advanced_flutter_course/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      Constant.contentType: Constant.applicationJson,
      Constant.accept: Constant.applicationJson,
      Constant.authorization: Constant.token,
      Constant.defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: const Duration(minutes: Constant.timeout1Min),
      receiveTimeout: const Duration(minutes: Constant.timeout1Min),
      headers: headers,
    );

    if(kReleaseMode) {
      print('Release mode, no logs');
    }
    else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
