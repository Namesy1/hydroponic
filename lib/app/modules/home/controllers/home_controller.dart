import 'dart:io';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxDouble nutrientLevel = 0.0.obs;
  final RxDouble pHLevel = 0.0.obs;
  final RxDouble solutionLevel = 0.0.obs;
  Socket? _socket;

  @override
  void onInit() {
    super.onInit();
    _connectToServer();
  }

  Future<void> _connectToServer() async {
    try {
      // Replace 'localhost' with the IP address of your server // computer ip for local host
      const String host = '192.168.137.1';
      const int port = 12345;
      _socket = await Socket.connect(host, port);

      _socket?.listen((List<int> data) {
        String receivedData = String.fromCharCodes(data);

        double newValue = double.tryParse(receivedData) ?? 0.0;
        nutrientLevel.value = newValue;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void sendData(double value) {
    if (_socket != null) {
      _socket!.write('$value\n');
    }
  }
}
