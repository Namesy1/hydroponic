import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColoredContainer extends StatelessWidget {
  final Color color;
  final double percentage;
  final String label;

  ColoredContainer(
      {required this.color, required this.percentage, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          width: 20,
          height: 100, // Adjust the height of the container as needed

          child: Stack(
            children: [
              Positioned.fill(
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor:
                      percentage / 100, // Adjusted height based on percentage
                  child: Container(
                    color: color, // Color of the filled portion
                    child: Center(child: Text('${percentage} litres')),
                  ),
                ),
              ),
              // You can add other widgets or text on top of the colored portion
            ],
          ),
        ).marginAll(5),
        Text(label).paddingSymmetric(vertical: 10)
      ],
    );
  }
}
