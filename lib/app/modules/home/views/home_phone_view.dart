import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePhoneView extends GetView<HomeController> {
  const HomePhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hydroponics'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            GaugeReader(controller: controller),
            GaugeReader(controller: controller),
            GaugeReader(controller: controller),
            Obx(
              () => Slider(
                value: controller.nutrientLevel(),
                min: 0,
                max: 100,
                onChanged: (value) {
                  // controller.sendData(value);
                  controller.nutrientLevel(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GaugeReader extends StatelessWidget {
  const GaugeReader({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
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
                value: controller.nutrientLevel(),
                cornerStyle: CornerStyle.bothCurve,
                width: 15,
                sizeUnit: GaugeSizeUnit.logicalPixel,
                gradient: SweepGradient(
                  colors: <Color>[
                    Theme.of(context).colorScheme.onSecondary,
                    Theme.of(context).colorScheme.surface,
                  ],
                  stops: <double>[0.25, 0.75],
                ),
              ),
              //the thumb
              MarkerPointer(
                value: controller.nutrientLevel(),
                enableDragging: true,
                onValueChanged: controller.sendData,
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
                  '${controller.nutrientLevel().ceil()}%',
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
    );
  }
}
