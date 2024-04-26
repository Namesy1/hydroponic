import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/statistics_controller.dart';

import 'widgets/export_widgets.dart';

class StatisticsView extends GetView {
  StatisticsView({Key? key}) : super(key: key);
  final fd = Get.put(StatisticsController());
  @override
  Widget build(BuildContext context) {
    var height = Get.mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chinese',
          style: TextStyle(
            fontSize: height * 0.04,
            fontVariations: const <FontVariation>[FontVariation('wght', 500.0)],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(BottomSheet(
                  onClosing: () {},
                  builder: (context) => Container(
                    height: 400,
                  ),
                ));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            right: -350,
            child: Hero(
              tag: '1',
              child: Image.asset(
                'assets/chinese.png',
                height: height,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'Day 02',
                  ),
                  Obx(() => Text(
                        '${fd.timerValue()} remaining',
                      )),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  itemDetail(
                      title: 'pH',
                      measurement: '4.3',
                      color: Colors.amber[100]),
                  itemDetail(
                      title: 'Water',
                      measurement: '40 ml',
                      color: Colors.green[200]),
                  itemDetail(
                      title: 'Temp',
                      measurement: '24\'C',
                      color: Colors.blueGrey[300]),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            height: height * 0.2,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton.outlined(
                          onPressed: () {}, icon: const Icon(Icons.close)),
                    ),
                    const Center(
                        child: Text(
                            'The current growth progress is good, keep it up'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
