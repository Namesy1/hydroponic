import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/statistics_controller.dart';
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
          statusBarBrightness: Brightness.dark),
      child: Scaffold(
          body: fd.obx(
              (state) => NestedScrollView(
                    floatHeaderSlivers: false,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          expandedHeight: Get.height * 0.2,
                          floating: false,
                          pinned: true,
                          systemOverlayStyle: SystemUiOverlayStyle(
                              statusBarColor: Colors.transparent,
                              statusBarBrightness: Brightness.light,
                              systemNavigationBarColor:
                                  Theme.of(context).scaffoldBackgroundColor),
                          flexibleSpace: FlexibleSpaceBar(
                              centerTitle: false,
                              title: const Text("Chinese",
                                  style: TextStyle(color: Colors.black)),
                              collapseMode: CollapseMode.pin,
                              background: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20))),
                                child: CarouselSlider(
                                    items: [
                                      Image.asset(
                                        "assets/images.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        "assets/images2.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        "assets/images3.jpg",
                                        fit: BoxFit.cover,
                                      )
                                    ],
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        disableCenter: true,
                                        viewportFraction: 1)),
                              )),
                        ),
                      ];
                    },
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withAlpha(100),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icon.png',
                                      height: 50,
                                    ),
                                    const Text('Information'),
                                  ],
                                ),
                                const Divider().paddingOnly(bottom: 10),
                                Text(
                                    'Planting date: ${DateFormat('dd/MM/yyyy').format(fd.start!)}'),
                                const Text('System health: Good'),
                                const Text('Growth progress: Excellent'),
                              ],
                            ).paddingAll(20),
                          ).paddingSymmetric(vertical: 10),

                          Container(
                            height: Get.height * 0.4,
                            // color: Colors.red,
                            // padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: AnimatedGrid(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    initialItemCount: items().length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 1,
                                            mainAxisExtent: Get.height * 0.15,
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (context, index, _) {
                                      return items()[index];
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time_rounded)
                                  .paddingOnly(right: 10),
                              Text('last reading 5min ago'),
                            ],
                          ),
                          Text('Approximated days till full harvest: 20'),
                          Text(
                              'Days elapsed since planting: ${DateTime.now().difference(fd.start!).inDays}'),
                          // LinearProgressIndicator(
                          //   value: 20,
                          //   minHeight: 40,
                          //   borderRadius: BorderRadius.circular(10),
                          //   backgroundColor: Colors.red,
                          //   semanticsValue: 'sdsd',
                          // ).paddingSymmetric(vertical: 10)

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Obx(() => ColoredContainer(
                          //           color: Colors.blue,
                          //           percentage: fd.solution(),
                          //           label: 'Nutrient',
                          //         )),
                          //     Obx(() => ColoredContainer(
                          //           color: Colors.blueGrey,
                          //           percentage: fd.acid(),
                          //           label: 'Acid',
                          //         )),
                          //     Obx(() => ColoredContainer(
                          //           color: Colors.blueAccent.shade100,
                          //           percentage: fd.base(),
                          //           label: 'Base',
                          //         )),
                          //   ],
                          // ).paddingSymmetric(vertical: 20)
                        ],
                      ).paddingSymmetric(horizontal: 20),
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
                      const LinearProgressIndicator()
                          .marginSymmetric(vertical: 10)
                    ],
                  ).paddingSymmetric(horizontal: 20))),
    );
  }

  List<Widget> items() {
    return [
      Obx(() => ItemDetail(
          title: 'pH', measurement: '${fd.pH}', color: Colors.green[200])),
      Obx(
        () => ItemDetail(
            title: 'TDS', measurement: '${fd.tds}', color: Colors.orange[200]),
      ),
      Obx(
        () => ItemDetail(
            title: 'solution',
            measurement: '${fd.solution}',
            color: Colors.blue[200]),
      ),
      // Obx(
      //   () => ItemDetail(
      //       title: 'temperature',
      //       measurement: '${fd.solution}',
      //       color: Colors.red[200]),
      // ),
    ];
  }
}
