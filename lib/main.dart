import 'package:flutter/material.dart';
import 'package:bolapedia_app/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bolapedia_app/screens/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Bolapedia',
        home: const LoginPage(),
      ),
    );
  }
}

