import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/connection_controller.dart';
import 'package:hydroponic/app/modules/home/controllers/home_controller.dart';
import 'package:hydroponic/app/modules/home/controllers/statistics_controller.dart';
import 'package:hydroponic/app/modules/home/views/widgets/export_widgets.dart';
import 'package:hydroponic/app/routes/app_pages.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF0C9869),
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: Get.size.height * 0.2,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: Get.size.height * 0.2 - 27,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0C9869),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Hi ${Get.find<HomeController>().user != null ? Get.find<HomeController>().user!.displayName : ''}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.logout,
                            ),
                            onPressed: () {
                              Get.find<ConnectionController>().signOut();
                            },
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 50,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.23),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                  hintText: "Search",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/icons/search.svg"),
                          ],
                        ).paddingSymmetric(horizontal: 20),
                      ).paddingSymmetric(horizontal: 20),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      const Text(
                        'Available',
                        style: TextStyle(
                            fontVariations: [FontVariation('wght', 600)]),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "More",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: Get.size.width * 0.4,
                          height: Get.size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSecondary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.STATISTICS);
                            },
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/chinese.png',
                                  height: Get.size.height * 0.2,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: Get.size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 5),
                                        blurRadius: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.23),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "chinese\n",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontVariations: [
                                                    const FontVariation(
                                                        'wght', 600)
                                                  ]),
                                            ),
                                            TextSpan(
                                                text: "Day 2",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ).marginOnly(right: 10),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: Get.size.width * 0.4,
                          height: Get.size.height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 5),
                                blurRadius: 10,
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: InkWell(
                            splashColor: Theme.of(context).colorScheme.primary,
                            onTap: () {
                              MyDialog.showConnectingDialog(
                                  title:
                                      'You need to upgrade your current hydroponic farm to perform this action',
                                  rightButtonAction: () => Get.back(),
                                  rightButtonText: 'close');
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.add), Text('Add new crop')],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class GaugeReader extends StatelessWidget {
  GaugeReader({
    super.key,
  });

  final controller = Get.find<StatisticsController>();

  @override
  Widget build(BuildContext context) {
    var height = Get.mediaQuery.size.height;
    return SizedBox(
      width: height * 0.2,
      height: height * 0.2,
      child: Obx(
        () => SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                  cornerStyle: CornerStyle.bothCurve,
                  color: Theme.of(context).disabledColor,
                  thickness: 15),
              pointers: <GaugePointer>[
                RangePointer(
                  value: controller.solution(),
                  cornerStyle: CornerStyle.bothCurve,
                  width: 15,
                  sizeUnit: GaugeSizeUnit.logicalPixel,
                  gradient: SweepGradient(
                    colors: <Color>[
                      Theme.of(context).colorScheme.onSecondary,
                      Theme.of(context).colorScheme.surface,
                    ],
                    stops: const <double>[0.25, 0.75],
                  ),
                ),
                //the thumb
                MarkerPointer(
                  value: controller.solution(),
                  enableDragging: true,
                  onValueChanged: (d) {},
                  markerHeight: 20,
                  markerWidth: 20,
                  markerType: MarkerType.circle,
                  color: Theme.of(context).colorScheme.primary,
                  borderWidth: 2,
                  borderColor: Colors.white54,
                ),
              ],

              //the text %
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  angle: 90,
                  axisValue: 5,
                  positionFactor: 0.2,
                  widget: Text(
                    '${controller.solution().ceil()}%',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xFFCC2B5E),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
