import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class SlideshowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 120.0,
        autoPlay: true,
      ),
      items: [
        _buildSlide(
          'Hydroponics',
          'assets/hydroponics_image.jpg',
          'Hydroponics is a method of growing plants without soil, using nutrient-rich water instead.',
        ),
        _buildSlide(
          'Advantages of Hydroponics',
          'assets/background.png',
          '1. Water Efficiency\n2. Space Saving\n3. Controlled Environment\n4. Faster Growth Rates',
        ),
        _buildSlide(
          'Green Vegetables',
          'assets/green_vegetables_image.png',
          'Green vegetables are rich in nutrients such as vitamins, minerals, and fiber, promoting good health.',
        ),
        _buildSlide(
          'Benefits of Green Vegetables',
          'assets/background.png',
          '1. Nutrient-Rich\n2. Low in Calories\n3. Support Weight Loss\n4. Improve Digestive Health',
        ),
      ],
    );
  }

  Widget _buildSlide(String title, String imagePath, String description) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(20)),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0),
      ).marginAll(10),
    ).paddingAll(5);
  }
}
