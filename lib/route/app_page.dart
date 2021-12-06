import 'package:flutter_architecture/presentation/home/controller/home_controller_binding.dart';
import 'package:flutter_architecture/presentation/home/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_route.dart';

List<GetPage<dynamic>> get appPages {
  return [
    GetPage<HomeScreen>(
      binding: HomeControllerBinding(),
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
    ),
  ];
}
