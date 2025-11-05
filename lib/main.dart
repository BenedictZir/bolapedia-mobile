import 'package:flutter/material.dart';
import 'package:bolapedia_app/screens/menu.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bolapedia',
      home: const HomePage()
    );
  }
}

