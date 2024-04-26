import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
// import 'package:video_player/video_player.dart';

class ConnectionController extends GetxController {
  ConnectionController();
  // late VideoPlayerController videoPlayerController;
  var connect = false.obs;
  @override
  void onInit() {
    // videoPlayerController = VideoPlayerController.asset('assets/water.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown quickly.
    //     videoPlayerController.play();

    //     videoPlayerController.setLooping(true);
    //   });
    super.onInit();
  }

  void connectToServer() {
    Get.dialog(Dialog.fullscreen(
      backgroundColor: Colors.black.withOpacity(0.4),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(
              'assets/connecting.json',
              repeat: true,
              reverse: false,
              animate: true,
            ),
            const Text(
              'Connecting',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    ));
    // connect.toggle();

    Future.delayed(Duration(seconds: 2))
        .then((value) => Get.toNamed(Routes.HOME));
  }
}
