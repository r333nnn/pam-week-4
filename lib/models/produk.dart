import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final int harga;
  final IconData ikon;

  const Produk({
    required this.nama,
    required this.harga,
    this.ikon = Icons.shopping_bag,
  });

  String get hargaRupiah {
    final s = harga.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return 'Rp $buf';
  }
}