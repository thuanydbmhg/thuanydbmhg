import 'dart:async';

import 'package:configuration/data/data_source/local/sessions_pref.dart';
import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/interceptor/auth_interceptor.dart';
import 'package:configuration/network/interceptor/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/grocery_api.dart';
import 'package:flutter_architecture/data/grocery/data_source/remote/user_api.dart';

class GroceryApiModule extends DIModule {
  @override
  provides() async {
    final dios = await setupX();
    // register api
    getIt.registerSingleton(
        GroceryApi(dios, baseUrl: 'http://191.173.3.106/s-cart/public/api/member/'));
  }

  static FutureOr<Dio> setupX() async {
    final options = BaseOptions(
      headers: {
        'User-Agent':'PostmanRuntime/7.28.4',
        'Accept':'*/*',
        'Authorization': 'Bearer ${SessionPref.getAccessTokenUser()}'
      },
      connectTimeout: BuildConfig.get()?.connectTimeout,
      receiveTimeout: BuildConfig.get()?.receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "http://191.173.3.106/s-cart/public/api/member/",
    );
    final Dio dios = Dio(options);


    /// Print Log (production mode removal)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dios.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dios;
  }
}
