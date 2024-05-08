import 'package:get/get.dart';
import 'package:hydroponic/app/middleware/auth_middleware.dart';
import 'package:hydroponic/app/modules/home/views/connection_view.dart';
import 'package:hydroponic/app/modules/home/views/statistics_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CONNECTION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
      transition: Transition.downToUp,
    ),
    GetPage(
        name: _Paths.CONNECTION,
        page: () => const ConnectionView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()],
        transition: Transition.upToDown),
    GetPage(
        name: _Paths.STATISTICS,
        page: () => StatisticsView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()],
        transition: Transition.rightToLeft),
  ];
}
