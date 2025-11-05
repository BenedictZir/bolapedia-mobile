import 'package:flutter/material.dart';
import 'package:bolapedia_app/screens/menu.dart';
import 'package:bolapedia_app/screens/product_form.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

@override
Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
decoration: BoxDecoration(
    color: Colors.blue,
  ),
  child: Column(
    children: [
      Text(
        'Bolapedia',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Text("Semua Perlengkapan Sepak Bola Ada Disini",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
      ),
    ],
  ),
          ),
          ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Home'),
  // Bagian redirection ke HomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.post_add),
  title: const Text('Add Product'),
  // Bagian redirection ke ProductFormPage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductFormPage(),
        ));
    },
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('View Products'),
            onTap: () {
            }
          )
        ],
      ),
    );
  }
}