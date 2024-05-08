import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/routes/app_pages.dart';

Widget plantContainer(String index) {
  var height = Get.mediaQuery.size.height;

  return SizedBox(
    width: height * 0.2,
    height: height * 0.2,
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.STATISTICS);
        },
        child: Column(
          children: [
            Hero(
                tag: index,
                child: Container(
                    height: 150,
                    child: Image.asset('assets/chinese.png',
                        height: height * 0.25))),
            Text(
              'Chinese',
              style: TextStyle(
                fontSize: height * 0.02,
                fontVariations: const <FontVariation>[
                  FontVariation('wght', 600.0)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
