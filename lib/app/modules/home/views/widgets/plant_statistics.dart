import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail(
      {super.key, required this.title, required this.measurement, this.color});
  final String title;
  final String measurement;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color!,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontVariations: <FontVariation>[FontVariation('wght', 600.0)],
                ),
              ),
              const Text('Good'),
              Row(
                children: [
                  Text(
                    measurement,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.height * 0.04,
                      fontVariations: <FontVariation>[
                        const FontVariation('wght', 600.0)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(top: 0, right: 0, child: Icon(Icons.donut_large_sharp))
        ],
      ),
    );
  }
}
