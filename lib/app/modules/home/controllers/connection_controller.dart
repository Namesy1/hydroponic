import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponic/app/models/data_from_wifi.dart';
import 'package:hydroponic/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:web_socket_channel/io.dart';

class ConnectionController extends GetxController {
  ConnectionController();
  var connect = false.obs;
  final RxDouble waterLevel = 0.0.obs;
  IOWebSocketChannel? channel;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    channel?.sink.close();
    super.onClose();
  }

  sendRequest() {
    if (channel != null) {
      channel!.sink.add('work on this information');
    } else {
      print("WebSocket channel is not initialized");
    }
  }

  void _connect() {
    showConnectingDialog();
    try {
      channel = IOWebSocketChannel.connect('ws://192.168.4.1:81');

      // channel!.ready.then((value) => Get.to(Routes.HOME));

      channel!.stream.listen(
        (message) {
          print(message);

          if (message.toString().contains('connected')) {
            Get.toNamed(Routes.HOME);
          } else {
            if (message.toString().contains('distance')) {
              final dataFromWifi = dataFromWifiFromJson(message);
              waterLevel.value = double.tryParse(dataFromWifi.distance!)!;
            }
          }

          // nutrientLevel.value = double.tryParse(message)!;
        },
        onDone: () {},
        onError: (error) {
          // Handle error here
          if (Get.isDialogOpen!) {
            Get.back();
          }
          Get.dialog(Dialog(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                    child: Text(
                        'Failed to connect to the Hydroponic server, Please check your network connection and try again. \n Make sure you are on the Hydroponic system network')),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(child: Text('Close')),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (Get.isDialogOpen!) {
                            Get.back();
                          }
                          _connect();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(child: Text('Retry')),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )));

          print("WebSocket error: $error");
        },
      );
    } catch (e) {
      print("Error connecting to WebSocket: $e");
      // Try to reconnect
    }
  }

  void connectToServer() {
    _connect();

    // connect.toggle();

    // Future.delayed(Duration(seconds: 2))
    //     .then((value) => Get.toNamed(Routes.HOME));
  }

  void showConnectingDialog() => Get.dialog(Dialog.fullscreen(
        backgroundColor: Colors.black.withOpacity(0.4),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset(
                'assets/connecting.json',
                repeat: true,
                reverse: false,
                animate: true,
              ),
              const Text(
                'Connecting',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ));
}
