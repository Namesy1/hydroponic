import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/routes/app_pages.dart';
import 'package:hydroponic/app/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    darkTheme: AppTheme.dark,
    theme: AppTheme.light,
  ));
}
