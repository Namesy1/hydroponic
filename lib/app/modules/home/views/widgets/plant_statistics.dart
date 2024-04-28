import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget itemDetail(
    {required String title, required String measurement, Color? color}) {
  var height = Get.mediaQuery.size.height;
  return Card(
    color: color,
    elevation: 10,
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      padding: const EdgeInsets.all(10),
      height: height * 0.15,
      width: height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          Expanded(
            child: Text(
              measurement,
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.06,
                fontVariations: const <FontVariation>[
                  FontVariation('wght', 600.0)
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
