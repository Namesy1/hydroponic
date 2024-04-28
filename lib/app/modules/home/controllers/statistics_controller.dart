import 'dart:async';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  RxString countdown = ''.obs;
  DateTime endTime = DateTime.now().add(Duration(days: 20));
  void startCountdown() {
    // Set the end time for the countdown

    // Update the countdown every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      Duration remainingTime = endTime.difference(DateTime.now());
      int days = remainingTime.inDays;
      int hours = remainingTime.inHours.remainder(24);
      int minutes = remainingTime.inMinutes.remainder(60);

      if (days >= 0) {
        countdown.value = '$days days, $hours hours, $minutes minutes';
      } else {
        countdown.value = 'Countdown expired';
        timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    startCountdown();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
