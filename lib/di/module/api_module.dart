import 'dart:async';

import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/interceptor/auth_interceptor.dart';
import 'package:configuration/network/interceptor/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/user_api.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setup();
    getIt.registerSingleton(dio);
    // register api
    getIt.registerSingleton(
        UserApi(dio, baseUrl: 'http://191.173.3.106/s-cart/public/api/admin/'));
  }

  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      headers: {
        'User-Agent':'PostmanRuntime/7.28.4',
        'Accept':'*/*'
      },
      connectTimeout: BuildConfig.get()?.connectTimeout,
      receiveTimeout: BuildConfig.get()?.receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "http://191.173.3.106/s-cart/public/api/admin/",
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    /// Adapt data (according to your own data structure, you can choose to add it)
    dio.interceptors.add(TokenInterceptor());

    /// Print Log (production mode removal)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dio;
  }
}
