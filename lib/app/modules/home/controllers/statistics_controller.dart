import 'dart:async';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  // Define the timer value as a RxString
  RxString timerValue = '29 days'.obs;
  late Timer _timer;
  int totalSeconds = 2505600; // Total seconds for 29 days

  // Start the timer
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (totalSeconds > 0) {
        // Decrease the total seconds by 1 second
        totalSeconds--;

        // Convert total seconds to days, hours, and minutes
        int days = totalSeconds ~/ (24 * 3600);
        int hours = (totalSeconds % (24 * 3600)) ~/ 3600;
        int minutes = (totalSeconds % 3600) ~/ 60;

        // Update the timer value string
        if (days > 0) {
          timerValue.value = '$days days';
        } else if (hours > 0) {
          timerValue.value = '$hours hours';
        } else {
          timerValue.value = '$minutes minutes';
        }
      } else {
        // Stop the timer when it reaches 0 seconds
        _timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }
}
