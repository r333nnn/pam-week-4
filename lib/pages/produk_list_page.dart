import 'package:flutter/material.dart';
import 'package:sesi3/models/produk.dart';
import 'package:sesi3/widgets_basic/product_card.dart';
import 'package:sesi3/pages/produk_detail_page.dart';

class ProdukListPage extends StatelessWidget {
  final List<Produk> produk;
  final void Function(Produk) onTambahKeranjang;
  final void Function(Produk) onHapus;

  const ProdukListPage({
    super.key,
    required this.produk,
    required this.onTambahKeranjang,
    required this.onHapus,
  });

  @override
  Widget build(BuildContext context) {
    if (produk.isEmpty) {
      return const Center(child: Text('Belum ada produk'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemCount: produk.length,
      itemBuilder: (context, index) {
        final item = produk[index];
        return ProductCard(
          nama: item.nama,
          harga: item.hargaRupiah,
          ikon: item.ikon,
          onDelete: () => onHapus(item),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukDetailPage(
                  produk: item,
                  onTambahKeranjang: () => onTambahKeranjang(item),
                ),
              ),
            );
          },
        );
      },
    );
  }
}