import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydroponic/app/routes/app_pages.dart';

class AuthService extends GetxService {
  static final GetStorage _getStorage = GetStorage();
  RxBool isLoggedIn = false.obs;

  Future<AuthService> init() async {
    isLoggedIn(_getStorage.read('isLoggedIn') ?? false);
    print(['Auth service logged?  ${isLoggedIn.value}']);
   
    return this;
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception('SignInFailed $e');
    }
  }

  void signOut() {
    try {
      
      FirebaseAuth.instance.signOut().then((_) {
        _getStorage.write('isLoggedIn', false);
        isLoggedIn.value = false;
        
        Get.offAllNamed(Routes.CONNECTION);
      });
    } on Exception catch (_) {
      rethrow;
    }
  }
}
          