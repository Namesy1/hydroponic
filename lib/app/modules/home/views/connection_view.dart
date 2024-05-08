import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/connection_controller.dart';

class ConnectionView extends GetView<ConnectionController> {
  const ConnectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/green_vegetables_image.png',
              ),
              Text(
                'Hydroponic farm'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontVariations: <FontVariation>[
                    const FontVariation('wght', 500.0),
                  ],
                ),
              ),
              const Text(
                'Enjoy farming the easy way',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              FilledButton.icon(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  controller.login();
                },
                icon: SvgPicture.asset('assets/icons/google.svg'),
                label: const Text(
                  'sign in with Google',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ).paddingAll(20),
            ],
          ),
        ),
      ),
    );
  }
}
