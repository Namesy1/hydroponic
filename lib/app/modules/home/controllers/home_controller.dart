import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {



  User? user = FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
   
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
