import 'package:flutter/material.dart';

class HtmlImageViewer extends StatelessWidget {
  final String identifier;

  const HtmlImageViewer({super.key, required this.identifier});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        height: 600,
        child: HtmlElementView(viewType: identifier),
      ),
    );
  }
}
