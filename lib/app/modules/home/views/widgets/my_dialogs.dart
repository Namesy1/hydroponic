import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  static Future<void> showLoadingDialog() {
    Get.isDialogOpen! ? Get.back() : null;
    return Get.dialog(
      barrierColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      Dialog(
        clipBehavior: Clip.antiAlias,
        backgroundColor: Theme.of(Get.context!).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/icon.png',
                  height: 50,
                ),
                CircularProgressIndicator(
                  backgroundColor:
                      Theme.of(Get.context!).scaffoldBackgroundColor,
                )
              ],
            ),
            const Text(
              'Please wait',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontVariations: [FontVariation('wght', 500)]),
            ).paddingAll(20),
          ],
        ).paddingAll(20),
      ),
    );
  }

  static Future<void> showConnectingDialog({
    required String title,
    bool hasTwoButtons = false,
    String leftButtonText = 'Close',
    String? rightButtonText,
    VoidCallback? rightButtonAction,
  }) {
    Get.isDialogOpen! ? Get.back() : null;
    return Get.dialog(
        transitionCurve: Curves.ease,
        barrierDismissible: false,
        barrierColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        Dialog(
          backgroundColor: Theme.of(Get.context!).colorScheme.primary,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(Get.context!).scaffoldBackgroundColor,
                        width: 5),
                    image: const DecorationImage(
                        image: AssetImage(
                      'assets/icon.png',
                    ))),
              ).marginOnly(top: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontVariations: [FontVariation('wght', 500)]),
              ).paddingAll(20),
              Row(
                children: [
                  hasTwoButtons
                      ? Expanded(
                          child: InkWell(
                          onTap: () => Get.back(),
                          splashColor:
                              Theme.of(Get.context!).scaffoldBackgroundColor,
                          child:
                              Center(child: Text(leftButtonText.toUpperCase()))
                                  .paddingSymmetric(vertical: 20),
                        ))
                      : const SizedBox(),
                  Expanded(
                      child: InkWell(
                    onTap: rightButtonAction,
                    splashColor: Theme.of(Get.context!).scaffoldBackgroundColor,
                    child: Center(child: Text(rightButtonText!.toUpperCase()))
                        .paddingSymmetric(vertical: 20),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
