import 'package:flutter/material.dart';
import 'package:bolapedia_app/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  String _formatRupiah(int value) {
    final s = value.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final reverseIndex = s.length - i;
      buf.write(s[i]);
      final atGroup = reverseIndex > 1 && reverseIndex % 3 == 1;
      if (atGroup) buf.write('.');
    }
    return 'Rp ${buf.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    final thumb = product.thumbnail ?? '';
    final hasThumb = thumb.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasThumb)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(thumb)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.broken_image, size: 50)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),

                  // Name
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Category & Brand chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        label: Text(product.category.toUpperCase()),
                        backgroundColor: const Color(0xFFDBEAFE), // blue100
                        labelStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D4ED8), // blue700
                        ),
                      ),
                      Chip(
                        label: Text('Brand: ${product.brand}'),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      Chip(
                        label: Text('ID: ${product.id}'),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      if (product.userId != null)
                        Chip(
                          label: Text('User: ${product.userId}'),
                          backgroundColor: Colors.grey.shade200,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Price & Stock
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _formatRupiah(product.price),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Text(
                        'Stock: ${product.stock}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16.0, height: 1.6),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}