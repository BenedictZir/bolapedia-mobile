import 'package:flutter/material.dart';
import 'package:bolapedia_app/screens/product_form.dart';
import 'package:bolapedia_app/screens/product_entry_list.dart';
import 'package:bolapedia_app/widgets/left_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Fungsi bantu untuk menampilkan snackbar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bolapedia')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.list_alt),
              label: const Text("All Products"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                _showSnackBar(context, "Kamu telah menekan tombol All Products");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductEntryListPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12), 
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_bag),
              label: const Text("My Products"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                _showSnackBar(context, "Kamu telah menekan tombol My Products");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductEntryListPage(myOnly: true),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_box),
              label: const Text("Create Product"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                _showSnackBar(context, "Kamu telah menekan tombol Create Product");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductFormPage(),
                  ),
                );  
              },
            ),
          ],
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}