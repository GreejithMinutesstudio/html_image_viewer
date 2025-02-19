import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.submit(),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          "SUBMIT",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
