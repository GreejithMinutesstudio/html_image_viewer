import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class UrlFormField extends StatelessWidget {
  UrlFormField({super.key});

  final HomeController controller = Get.find<HomeController>();

  // Regular expression for validating image URLs
  final RegExp imageUrlRegex = RegExp(
    r'^(https?:\/\/.*\.(?:png|jpg|jpeg|gif|svg|webp))|^(https?:\/\/.*\/)$',
    caseSensitive: false,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: TextFormField(
        controller: controller.urlController,
        decoration: InputDecoration(
          hintText: 'Image URL',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => controller.urlController.clear(),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an image URL';
          } else if (!imageUrlRegex.hasMatch(value)) {
            return 'Enter a valid image URL (png, jpg, jpeg, gif, svg, webp)';
          }
          return null;
        },
        keyboardType: TextInputType.url,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
