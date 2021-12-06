import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';

import 'package:get/get.dart';


class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(),permanent: true);
  }
}
