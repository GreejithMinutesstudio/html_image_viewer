import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class BackgroundShade extends StatelessWidget {
  BackgroundShade({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isMenuOpen.value
        ? GestureDetector(
            onTap: controller.toggleMenu,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          )
        : SizedBox.shrink());
  }
}
