import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_image_loader/ui/components/shimmer_widget.dart';
import 'package:html_image_loader/ui/components/url_form_field.dart';
import '../controller/home_controller.dart';
import 'components/MenuButton.dart';
import 'components/backround_shade.dart';
import 'components/html_image_viewer.dart';
import 'components/place_holder.dart';
import 'components/submit_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Viewer")),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(() => _buildImageDisplay()),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: UrlFormField(),
                    ),
                    const SizedBox(width: 10),
                    Obx(() => controller.isUrlEntered.value
                        ? SubmitButton()
                        : SizedBox()),
                  ],
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
          BackgroundShade(),
          MenuButton(),
        ],
      ),
    );
  }

  Widget _buildImageDisplay() {
    if (controller.isLoading.value) {
      return ShimmerSquare(size: 600);
    } else if (controller.viewId.isNotEmpty) {
      return HtmlImageViewer(identifier: controller.viewId.value);
    } else {
      return PlaceHolder();
    }
  }
}
