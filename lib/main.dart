import 'package:flutter/material.dart';
import 'package:html_image_loader/ui/home.dart';

/// Entrypoint of the application.
void main() {
  runApp(const MyApp());
}

/// Application itself.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home:  HomePage());
  }
}
