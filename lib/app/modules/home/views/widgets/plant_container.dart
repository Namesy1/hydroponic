import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/routes/app_pages.dart';

Widget plantContainer(String index) {
  var height = Get.mediaQuery.size.height;

  return InkWell(
    customBorder: const RoundedRectangleBorder(),
    onTap: () {
      Get.toNamed(Routes.STATISTICS);
    },
    child: Card(
      // shape: ,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 5,
      child: Container(
        height: height * 0.3,
        width: height * 0.25,
        alignment: Alignment.center,
        child: Column(
          children: [
            Hero(
                tag: index,
                child: Container(
                    height: height * 0.2,
                    padding: EdgeInsets.all(20),
                    child: Image.asset('assets/chinese.png',
                        height: height * 0.25))),
            Expanded(
              child: Text(
                'Chinese',
                style: TextStyle(
                  fontSize: height * 0.03,
                  fontVariations: const <FontVariation>[
                    FontVariation('wght', 600.0)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
