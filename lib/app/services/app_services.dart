import 'package:get/get.dart';
import 'package:hydroponic/app/services/auth_service.dart';
import 'package:hydroponic/app/services/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';

class AppServices {
  Future<AppServices> init() async {
     if (GetPlatform.isAndroid) {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }
    Get.putAsync(() async => NotificationService().init());
    Get.putAsync(() async => AuthService().init());
    return this;
  }
}
