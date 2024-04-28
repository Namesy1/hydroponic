import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hydroponic/app/modules/home/controllers/connection_controller.dart';

// import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class ConnectionView extends GetView<ConnectionController> {
  const ConnectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = Get.mediaQuery.size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
                    'Smart Hydroponics Monitor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: height * 0.04,
                      fontVariations: const <FontVariation>[
                        FontVariation('wght', 500.0)
                      ],
                    ),
                  ),
                  const Text(
                    'Enjoy farming the easy way',
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                  ),
                  const Spacer(),
                  FilledButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    // padding: const EdgeInsets.all(25),
                    onPressed: controller.connectToServer,
                    child: SizedBox(
                      height: height * 0.08,
                      width: Get.width * 0.8,
                      child: Center(
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.02,
                            fontVariations: const <FontVariation>[
                              FontVariation('wght', 500.0)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
