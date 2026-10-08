import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String nama;
  final String harga;
  final IconData ikon;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const ProductCard({
    super.key,
    required this.nama,
    required this.harga,
    required this.onTap,
    this.ikon = Icons.shopping_bag,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Icon(ikon, size: 56, color: Colors.teal),
              ),
            ),
            Text(
              nama,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(harga, style: const TextStyle(color: Colors.grey)),
                ),
                if (onDelete != null)
                  InkWell(
                    onTap: onDelete,
                    child: const Icon(Icons.delete_outline,
                        color: Colors.red, size: 22),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}