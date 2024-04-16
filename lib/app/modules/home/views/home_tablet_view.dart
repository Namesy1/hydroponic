import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeTabletView extends GetView {
  const HomeTabletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeTabletView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeTabletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
