import 'package:flutter/material.dart';

void main() {
  runApp(const FootballShopApp());
}

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showSnackbar(BuildContext context, String message) {
    // Hapus snackbar lama lalu tampilkan yang baru
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 22),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold adalah "kerangka" halaman (AppBar, body, dsb.)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Shop'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // atur posisi vertikal di tengah
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat datang di Football Shop!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            // Tiga tombol diletakkan dalam Column; beri spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    icon: Icons.list_alt,
                    label: 'All Products',
                    color: Colors.blue,
                    onPressed: () => _showSnackbar(
                      context,
                      'Kamu telah menekan tombol All Products',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    icon: Icons.person,
                    label: 'My Products',
                    color: Colors.green,
                    onPressed: () => _showSnackbar(
                      context,
                      'Kamu telah menekan tombol My Products',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: _buildActionButton(
                context: context,
                icon: Icons.add_box,
                label: 'Create Product',
                color: Colors.red,
                onPressed: () => _showSnackbar(
                  context,
                  'Kamu telah menekan tombol Create Product',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
