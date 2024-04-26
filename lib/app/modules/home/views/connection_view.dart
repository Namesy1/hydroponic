import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydroponic/app/modules/home/controllers/connection_controller.dart';

import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class ConnectionView extends GetView<ConnectionController> {
  const ConnectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = Get.mediaQuery.size.height;
    return Scaffold(
      body: SafeArea(
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
              statusBarColor: Color(0xffF2F1F3),
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Color(0xffF2F1F3),
              systemNavigationBarIconBrightness: Brightness.dark),
          child: Stack(
            children: [
              // Positioned(
              //     bottom: 0,
              //     height: 200,
              //     width: Get.width,
              //     child: Opacity(
              //         opacity: 0.2,
              //         child: VideoPlayer(controller.videoPlayerController))),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/plant.png',
                      height: height * 0.6,
                    ),
                    Text(
                      'HYDROPONIC SYSTEM',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: height * 0.05,
                        fontVariations: const <FontVariation>[
                          FontVariation('wght', 500.0)
                        ],
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enjoy farming the easy way',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton.filled(
                        padding: const EdgeInsets.all(25),
                        onPressed: controller.connectToServer,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
