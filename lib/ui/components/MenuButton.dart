import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class MenuButton extends StatelessWidget {
  MenuButton({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Obx(() => controller.isMenuOpen.value
              ? Column(
                  children: [
                    FloatingActionButton.extended(
                      heroTag: "enterFS",
                      onPressed: () {
                        controller.enterFullScreenOnTap();
                        controller.toggleMenu();
                      },
                      label: Text("Enter Fullscreen"),
                      icon: Icon(Icons.fullscreen),
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton.extended(
                      heroTag: "exitFS",
                      onPressed: () {
                        controller.exitFullScreenOnTap();
                        controller.toggleMenu();
                      },
                      label: Text("Exit Fullscreen"),
                      icon: Icon(Icons.fullscreen_exit),
                    ),
                    const SizedBox(height: 8),
                  ],
                )
              : SizedBox.shrink()),
          FloatingActionButton(
            onPressed: controller.toggleMenu,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
