import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydroponic/app/modules/home/views/widgets/export_widgets.dart';
import 'package:hydroponic/app/routes/app_pages.dart';
import 'package:hydroponic/app/services/auth_service.dart';

class ConnectionController extends GetxService {
  ConnectionController();
  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
  MyDialog.  showLoadingDialog();
    final UserCredential? user =
        await AuthService.signInWithGoogle().onError((error, stackTrace) {
     MyDialog. showConnectingDialog(
          title:
              'There might be an issue with the internet connection, check your internet connectivity and try again',
          hasTwoButtons: true,
          leftButtonText: 'cancel',
          rightButtonText: 'retry',
          rightButtonAction: () => login());
      return null;
    });
    if (user != null) {
      GetStorage().write('isLoggedIn', true);
      Get.offAllNamed(
        Routes.HOME,
      );
    }
  }

  void signOut() {
    MyDialog.showConnectingDialog(
        title: 'You are about to be signed out, do you wish to proceed?',
        hasTwoButtons: true,
        leftButtonText: 'no',
        
        rightButtonText: 'yes',
        rightButtonAction: () => AuthService().signOut());
  }

  @override
  void onClose() {
    super.onClose();
  }

 }
