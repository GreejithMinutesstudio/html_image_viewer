import 'package:flutter/material.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Placeholder Image
          Icon(
            Icons.image,
            size: 600,
            blendMode: BlendMode.overlay,
            color: Colors.black,
          ),
          // Text Overlay
          Text(
            "Enter URL and press Button "
            "\nexample: https://picsum.photos/500/500",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
