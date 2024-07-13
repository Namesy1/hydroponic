import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail(
      {super.key,
      required this.title,
      required this.measurement,
      this.unit,
      this.color,
      this.isLow});
  final String title;
  final String? unit;
  final String measurement;
  final Color? color;
  final bool? isLow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isLow! ? color! : Colors.red,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: context.textTheme.headlineLarge,
              ),
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(measurement,
                            style: context.textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white))
                        .paddingOnly(right: 10),
                    Text(unit!)
                  ],
                ),
              ),
              Text(isLow! ? 'Good' : 'Bad'),
            ],
          ),
          Positioned(top: 0, right: 0, child: Icon(Icons.donut_large_sharp))
        ],
      ),
    );
  }
}
