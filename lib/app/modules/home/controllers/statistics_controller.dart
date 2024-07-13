import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydroponic/app/models/sensor_readings.dart';

class StatisticsController extends GetxController with StateMixin <List<Rx<SensorReadings>>>{
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  final databaseReference = FirebaseDatabase.instance.ref();
  List<Rx<SensorReadings>> readings = [];
  Rx<SensorReadings> ph = SensorReadings().obs;
  Rx<SensorReadings> tdss = SensorReadings().obs;
  Rx<SensorReadings> solutions = SensorReadings().obs;

  RxBool ispHLow = false.obs;
  RxBool istdsLow = false.obs;
  RxBool isSolutionLow = false.obs;
  RxBool systemHealth = false.obs;
  RxBool power = false.obs;
  void showSnack(SensorReadings r) {
    Get.isSnackbarOpen ? Get.closeAllSnackbars() : null;
    Get.showSnackbar(GetSnackBar(
      title: r.name,
      message: 'The ${r.name} value is not optimal',
      isDismissible: true,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.all(20),
      mainButton: IconButton(
          onPressed: () {
            Get.closeCurrentSnackbar();
          },
          icon: const Icon(Icons.close)),
      showProgressIndicator: true,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      dismissDirection: DismissDirection.down,
    ));
  }

  @override
  void onInit() {
    everAll([isSolutionLow, ispHLow, istdsLow], (_) {
      if (isSolutionLow.isTrue && ispHLow.isTrue && istdsLow.isTrue) {
        systemHealth(true);
      } else {
        systemHealth(false);
      }
    });
    ever(solutions, (callback) {
      callback.value < 30 ? showSnack(callback) : null;
    });
    ever(ph, (callback) {
      !(callback.value.isGreaterThan(5.5) && callback.value.isLowerThan(6.5))
          ? showSnack(callback)
          : null;
    });
    ever(tdss, (callback) {
      !(callback.value.isGreaterThan(1700) && callback.value.isLowerThan(2100))
          ? showSnack(callback)
          : null;
    });
    listenForData();
    super.onInit();
  }

  void listenForData() {
    change(null, status: RxStatus.loading());
    try {
      databaseReference.child('crop/chinese').onValue.listen((event) {
        print(event.snapshot.value);
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> values = event.snapshot.value as Map;
          start = DateTime.tryParse(values['start'])!;
          end = DateTime.tryParse(values['end'])!;
          var solutionReading =
              (double.tryParse(values['sensor_readings']['solution_level'])!);
          var phReading = (double.tryParse(values['sensor_readings']['ph'])!)
              .toPrecision(2);
          var tdsReading = (double.tryParse(values['sensor_readings']['tds'])!);

          isSolutionLow(solutionReading > 30);
          ispHLow(phReading.isGreaterThan(5.5) && phReading.isLowerThan(6.5));
          istdsLow(
              tdsReading.isGreaterThan(1700) && tdsReading.isLowerThan(2100));
          solutions.update((val) {
            val!.name = 'solution';
            val.unit = '%';
            val.value = solutionReading;
            val.optimal = isSolutionLow.value;
          });

          ph.update(
            (val) {
              val!.name = 'pH';
              val.value = phReading;
              val.optimal = ispHLow.value;
            },
          );
          tdss.update((val) {
            val!.name = 'tds';
            val.unit = 'ppm';
            val.value = tdsReading;
            val.optimal = istdsLow.value;
          });

          readings.clear();
          readings.addAll([
            solutions,
            ph,
            tdss,
          ]);
        }
        change(readings, status: RxStatus.success());
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void onOff() {
    power.toggle();
    print(power.value);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
