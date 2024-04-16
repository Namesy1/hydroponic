import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hydroponic/app/modules/home/controllers/home_controller.dart';

import 'export_home.dart';

class HomeScreenConfig extends GetResponsiveView<HomeController> {
  HomeScreenConfig({Key? key}) : super(key: key);
  @override
  Widget builder() {
    if (screen.isPhone) {
      return  HomePhoneView();
    } else if (screen.isTablet) {
      return HomeTabletView();
    } else if (screen.isDesktop) {
      return HomeDesktopView();
    } else if (screen.isWatch) {
      return const SizedBox();
    }
    return  HomePhoneView();
  }
}
