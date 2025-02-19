import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html';
import 'package:js/js.dart';

@JS('toggleFullScreen')
external void toggleFullScreen();

@JS('enterFullScreen')
external void enterFullScreen();

@JS('exitFullScreen')
external void exitFullScreen();

class HomeController extends GetxController {
  var viewId = ''.obs;
  var isMenuOpen = false.obs;
  var isLoading = false.obs;

  var isUrlEntered = false.obs;
  final TextEditingController urlController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    urlController.addListener(() {
      isUrlEntered.value = urlController.text.isNotEmpty;
    });
  }

  @override
  void onClose() {
    urlController.dispose();
    super.onClose();
  }

  void submit() {
    bool isValid = formKey.currentState?.validate() == true;
    debugPrint("formKey.currentState?.validate() = $isValid");

    if (isValid) {
      debugPrint("✅ Valid Image URL: ${urlController.text}");
      loadImage();
    } else {
      debugPrint("❌ Invalid URL");
    }
  }

  Future<void> loadImage() async {
    if (urlController.text.isEmpty) return;

    isLoading.value = true; // Start shimmer loading
    viewId.value = 'html-img-${DateTime.now().millisecondsSinceEpoch}';

    debugPrint("🔄 Loading Image: ${urlController.text}");

    try {
      platformViewRegistry.registerViewFactory(viewId.value, (int viewId) {
        final imgElement = ImageElement()
          ..src = urlController.text
          ..style.width = '600px'
          ..style.height = 'auto'
          ..style.cursor = 'pointer'
          ..onDoubleClick.listen((_) {
            toggleFullScreen();
          })
          ..onLoad.listen((_) {
            debugPrint("✅ Image Loaded Successfully");
            isLoading.value = false; // **STOP LOADING**
          });
        imgElement.onError.listen((event) {
          debugPrint("❌ Error Loading Image: $event");
          isLoading.value = false; // **STOP LOADING ON ERROR**

          // Set a placeholder image on error
          imgElement.src = "assets/404.png";
          imgElement.style.width = '500px';
          imgElement.style.height = '500px';
        });
        return imgElement;
      });
      Future.delayed(Duration(seconds: 3), () {
        if (isLoading.value) {
          debugPrint("⚠️ Warning: Image still loading after 3 seconds.");
          isLoading.value = false;
        }
      });
    } catch (e) {
      debugPrint("❗ Exception: $e");
      isLoading.value = false;
    }
  }

  // Toggle the menu state
  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
    debugPrint("Menu state toggled to: ${isMenuOpen.value}");
  }

  void enterFullScreenOnTap() {
    debugPrint("enterFullScreen");
    enterFullScreen();
  }

  void exitFullScreenOnTap() {
    debugPrint("exitFullScreen");
    exitFullScreen();
  }
}
