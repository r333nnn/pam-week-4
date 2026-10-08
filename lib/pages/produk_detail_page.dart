import 'package:flutter/material.dart';
import 'package:sesi3/models/produk.dart';

class ProdukDetailPage extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTambahKeranjang;

  const ProdukDetailPage({
    super.key,
    required this.produk,
    required this.onTambahKeranjang,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(produk.ikon, size: 96, color: Colors.teal),
            ),
            const SizedBox(height: 20),
            Text(
              produk.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(produk.hargaRupiah,
                style: const TextStyle(fontSize: 18, color: Colors.teal)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onTambahKeranjang,
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}