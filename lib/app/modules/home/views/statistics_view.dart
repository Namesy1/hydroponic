import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/statistics_controller.dart';
import 'package:hydroponic/app/modules/home/views/home_view.dart';
import 'package:intl/intl.dart';
import 'widgets/export_widgets.dart';

class StatisticsView extends GetView {
  StatisticsView({Key? key}) : super(key: key);
  final fd = Get.put(StatisticsController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: context.theme.scaffoldBackgroundColor),
      child: Scaffold(
        floatingActionButton: Visibility(
          visible: false,
          child: FloatingActionButton.large(
            elevation: 0,
            shape: CircleBorder(),
            onPressed: fd.onOff,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.power_settings_new_rounded),
                Text("On"),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: fd.obx(
          (state) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: Get.height * 0.5,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30))),
                      child: CarouselSlider(
                          items: [
                            Image.asset(
                              "assets/IMG-20240616-WA0061.jpg",
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              "assets/IMG-20240616-WA0087.jpg",
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              "assets/IMG-20240616-WA0101.jpg",
                              fit: BoxFit.cover,
                            )
                          ],
                          options: CarouselOptions(
                              autoPlay: true,
                              disableCenter: true,
                              viewportFraction: 1)),
                    ),
                    Positioned(
                      bottom: -120,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 190,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(100),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icon.png',
                                  height: 50,
                                ),
                                const Text(
                                  'Information',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Table(
                                  columnWidths: const {
                                    0: FractionColumnWidth(0.7),
                                    1: FractionColumnWidth(0.3),
                                  },
                                  children: [
                                    TableRow(children: [
                                      const Text('Planting date:'),
                                      Text(
                                          '${DateFormat('dd/MM/yyyy').format(fd.start)}')
                                    ]),
                                    TableRow(children: [
                                      const Text('System health:'),
                                      Obx(() => Text(fd.systemHealth.value
                                          ? 'Good'
                                          : 'needs attention'))
                                    ]),
                                    TableRow(children: [
                                      const Text(
                                          'Approximated days till full harvest'),
                                      Text(
                                          '${fd.end.difference(DateTime.now()).inDays} days')
                                    ]),
                                    TableRow(children: [
                                      const Text(
                                          'Days elapsed since planting:'),
                                      Text(
                                          '${DateTime.now().difference(fd.start).inDays} days')
                                    ])
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('last reading 5 min ago'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ).paddingSymmetric(vertical: 0),
                    ),
                  ],
                ),
                Container(
                  height: Get.height * 0.3,
                  // color: Colors.red,
                  // padding: const EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 110),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GridView.custom(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          childrenDelegate: SliverChildListDelegate(
                            fd.readings
                                .map((e) => Obx(
                                      () => ItemDetail(
                                          isLow: e().optimal,
                                          title: e().name,
                                          unit: e().unit,
                                          measurement: e().name.contains('pH')
                                              ? e().value.toString()
                                              : e().value.ceil().toString(),
                                          color: e().optimal
                                              ? Colors.green[200]
                                              : Colors.white),
                                    ))
                                .toList(),
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 5.5 / 3,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(vertical: 20, horizontal: 10),
              ],
            ),
          ),
          onLoading: Center(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/icon.png',
                        height: 50,
                      ),
                      CircularProgressIndicator(
                        backgroundColor:
                            Theme.of(Get.context!).scaffoldBackgroundColor,
                      )
                    ],
                  ),
                  const Text(
                    'Please wait',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontVariations: [FontVariation('wght', 500)]),
                  ).paddingAll(20),
                ],
              ).paddingAll(20),
            ).paddingAll(20),
          ),
          onError: (error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error.toString()),
              const LinearProgressIndicator().marginSymmetric(vertical: 10)
            ],
          ).paddingAll(20),
        ),
      ),
    );
  }
}
