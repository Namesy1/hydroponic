import 'package:get/get.dart';

import 'package:firebase_database/firebase_database.dart';

class StatisticsController extends GetxController with StateMixin {
  RxString countdown = ''.obs;
  RxDouble pH = 0.0.obs;
  RxDouble tds = 0.0.obs;
  RxDouble acid = 0.0.obs;
  RxDouble base = 0.0.obs;
  RxDouble solution = 0.0.obs;
  DateTime start = DateTime.now();
  final databaseReference = FirebaseDatabase.instance.ref();

  void listenForData() {
    change(null, status: RxStatus.loading());
    try {
      databaseReference.child('crop/chinese').onValue.listen((event) {
        print(event.snapshot.value);
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> values = event.snapshot.value as Map;
          start = DateTime.tryParse(values['start'])!;
          pH.value =
              double.tryParse(values['sensor_readings']['ph'].toString())!;
          tds.value =
              double.tryParse(values['sensor_readings']['tds'].toString())!;
          acid.value =
              double.tryParse(values['sensor_readings']['acid'].toString())!;
          base.value =
              double.tryParse(values['sensor_readings']['base'].toString())!;
          solution.value = double.tryParse(
              values['sensor_readings']['solution_level'].toString())!;

          change(null, status: RxStatus.success());
        }
      });
    } catch (e) {
      print(e);
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    listenForData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
