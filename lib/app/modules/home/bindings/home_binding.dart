import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/connection_controller.dart';
import 'package:hydroponic/app/modules/home/controllers/statistics_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ConnectionController>(
      () => ConnectionController(),
    );
    Get.lazyPut<StatisticsController>(
      () => StatisticsController(),
    );
  }
}
