import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';

class NotificationService extends GetxService {
  static final _notification = FlutterLocalNotificationsPlugin();
  static const androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'hydroponic',
    'hydroponic',
    channelDescription: 'hydroponic notification',
    importance: Importance.max,
    priority: Priority.high,
  );
  static const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

  Future<NotificationService> init() async {
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/icon'),
        iOS: DarwinInitializationSettings(),
      ),
    );

    FirebaseMessaging.onMessage.listen((event) async {
      await pushNotification(event);
    });
    return this;
  }

  static pushNotification(
    RemoteMessage message,
  ) async {
    var platformChannelSpecifics = const NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await _notification.show(0, message.notification!.title,
        message.notification!.body, platformChannelSpecifics);
  }
}

Future<String?> saveDeviceToken() async {
  String? deviceToken = '';
  if (!GetPlatform.isWeb) {
    deviceToken = (await FirebaseMessaging.instance.getToken())!;
  }
  return deviceToken;
}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  debugPrint(
      "onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
}
