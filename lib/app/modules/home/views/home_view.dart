import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/home_controller.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'widgets/export_widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.mediaQuery.size.height;
    // var width = Get.mediaQuery.size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to your Hydroponic Farm',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontVariations: [const FontVariation('wght', 500)]),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Current Crops',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    plantContainer('1') // Add more crop cards here
                  ],
                ),
              ),

              SlideshowWidget(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Add New Crops',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Add more widgets for adding new crops here
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          onPressed: () {
            // Handle adding new crops
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCropCard(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(name),
        ],
      ),
    );
  }
}
      
      
//       SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             ListTile(
//               leading: Image.asset('assets/icon.png'),
//               title: Text(
//                 'HYDROPONIC',
//                 style: TextStyle(
//                   fontSize: height * 0.02,
//                   fontVariations: const <FontVariation>[
//                     FontVariation('wght', 500.0)
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     plantContainer('1'),
//                     plantContainer('2'),
//                     plantContainer('3'),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
    
    
//     );
//   }
// }

// class GaugeReader extends StatelessWidget {
//   const GaugeReader({
//     super.key,
//     required this.controller,
//   });

//   final HomeController controller;

//   @override
//   Widget build(BuildContext context) {
//     var height = Get.mediaQuery.size.height;
//     return SizedBox(
//       width: height * 0.2,
//       height: height * 0.2,
//       child: Obx(
//         () => SfRadialGauge(
//           axes: <RadialAxis>[
//             RadialAxis(
//               minimum: 0,
//               maximum: 100,
//               showLabels: false,
//               showTicks: false,
//               radiusFactor: 0.8,
//               axisLineStyle: AxisLineStyle(
//                   cornerStyle: CornerStyle.bothCurve,
//                   color: Theme.of(context).disabledColor,
//                   thickness: 15),
//               pointers: <GaugePointer>[
//                 RangePointer(
//                   value: controller.nutrientLevel(),
//                   cornerStyle: CornerStyle.bothCurve,
//                   width: 15,
//                   sizeUnit: GaugeSizeUnit.logicalPixel,
//                   gradient: SweepGradient(
//                     colors: <Color>[
//                       Theme.of(context).colorScheme.onSecondary,
//                       Theme.of(context).colorScheme.surface,
//                     ],
//                     stops: const <double>[0.25, 0.75],
//                   ),
//                 ),
//                 //the thumb
//                 MarkerPointer(
//                   value: controller.nutrientLevel(),
//                   enableDragging: true,
//                   onValueChanged: (d) {},
//                   markerHeight: 20,
//                   markerWidth: 20,
//                   markerType: MarkerType.circle,
//                   color: Theme.of(context).colorScheme.primary,
//                   borderWidth: 2,
//                   borderColor: Colors.white54,
//                 ),
//               ],

//               //the text %
//               annotations: <GaugeAnnotation>[
//                 GaugeAnnotation(
//                   angle: 90,
//                   axisValue: 5,
//                   positionFactor: 0.2,
//                   widget: Text(
//                     '${controller.nutrientLevel().ceil()}%',
//                     style: const TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       // color: Color(0xFFCC2B5E),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
