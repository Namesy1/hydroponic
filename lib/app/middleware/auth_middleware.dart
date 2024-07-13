import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydroponic/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 10;


  @override
  RouteSettings? redirect(String? route) {
    // Return RouteSettings to redirect to a new route, or null to proceed with the requested route
    if (route == Routes.CONNECTION &&
        GetStorage().read('isLoggedIn') == true) {
      return const RouteSettings(
          name: Routes.HOME); // Redirect to login if admin is not logged in
    } else {
      return null; // Proceed with the requested route
    }
  }
}
