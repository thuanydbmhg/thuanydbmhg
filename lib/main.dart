import 'dart:async';

import 'package:configuration/environment/env.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/route/app_page.dart';
import 'package:flutter_architecture/route/app_route.dart';
import 'package:flutter_architecture/style/style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

/// EndPoint default
void main() => Main();

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    Style.styleDefault();
    return Application();
  }

  @override
  Future? onInjection() async {
    await Injection.inject();
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        title: 'flutter architecture',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        initialRoute: AppRoutes.HOME,
        getPages: appPages,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
