import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/routes/app_pages.dart';
import 'package:hydroponic/app/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xffF2F1F3),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xffF2F1F3),
          systemNavigationBarIconBrightness: Brightness.dark),
    child:
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      
    ),
    ),
  );
}
