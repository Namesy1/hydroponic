import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
 
  final RxDouble pHLevel = 0.0.obs;
  final RxDouble solutionLevel = 0.0.obs;
  PageController pageController = PageController();

  var data = ''.obs;
  var currentIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

 
 

  void selectedBottomBarIndex(int index) {
    currentIndex(index);
    pageController.jumpToPage(index);
  }



  @override
  void onClose() {
    super.onClose();
  }
}
