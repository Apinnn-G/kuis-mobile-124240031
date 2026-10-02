import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets.dart';

class DetailPage extends StatelessWidget {
  final Shoe shoe;
  const DetailPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.shoeName, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'img-${shoe.id}',
                  child: NetImage(
                    url: sized(shoe.image, 900),
                    width: double.infinity,
                    height: 240,
                    radius: 12,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  shoe.shoeName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  shoe.category,
                  style: const TextStyle(fontSize: 12, color: Colors.black45),
                ),
                const SizedBox(height: 12),
                Text(
                  shoe.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Deskripsi',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(shoe.description, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 16),
                const Text(
                  'Ukuran',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final s in shoe.sizes)
                      Chip(
                        label: Text(s, style: const TextStyle(fontSize: 12)),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 6),
                    Text(
                      'Stok: ${shoe.stock}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 20),
                    const SizedBox(width: 6),
                    Text(
                      '${shoe.likes} suka',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
