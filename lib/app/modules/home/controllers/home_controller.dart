import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:web_socket_channel/io.dart';

class HomeController extends GetxController {
  final RxDouble nutrientLevel = 0.0.obs;
  final RxDouble pHLevel = 0.0.obs;
  final RxDouble solutionLevel = 0.0.obs;
  PageController pageController = PageController();

  var data = ''.obs;
  var currentIndex = 0.obs;

  IOWebSocketChannel? channel;

  @override
  void onInit() {
    super.onInit();
    _connect();
  }

  void _connect() {
    try {
      channel = IOWebSocketChannel.connect('ws://192.168.4.1:81');
      channel!.stream.listen(
        (message) {
          print(message);
          nutrientLevel.value = double.tryParse(message)!;
        },
        onError: (error) {
          // Handle error here
          print("WebSocket error: $error");
          // Try to reconnect
          // _reconnect();
        },
        onDone: () {
          // Handle socket disruption
          print("WebSocket connection closed");
          // Try to reconnect
          // _reconnect();
        },
      );
    } catch (e) {
      print("Error connecting to WebSocket: $e");
      // Try to reconnect
      _reconnect();
    }
  }

  void _reconnect() {
    // Close the existing channel if it exists
    channel?.sink.close();

    // Reconnect after a short delay
    Future.delayed(const Duration(seconds: 5), () {
      _connect();
    });
  }

  void selectedBottomBarIndex(int index) {
    currentIndex(index);
    pageController.jumpToPage(index);
  }

  sendRequest() {
    if (channel != null) {
      channel!.sink.add('work on this information');
    } else {
      print("WebSocket channel is not initialized");
    }
  }

  @override
  void onClose() {
    channel?.sink.close();
    super.onClose();
  }
}
