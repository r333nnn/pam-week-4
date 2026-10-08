import 'package:flutter/material.dart';
import 'package:sesi3/models/produk.dart';
import 'package:sesi3/pages/produk_list_page.dart';
import 'package:sesi3/pages/profil_page.dart';
import 'package:sesi3/pages/tambah_produk_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _tabTerpilih = 0;
  int _jumlahKeranjang = 0;

  final List<Produk> _produk = [
    const Produk(nama: 'Kursi Minimalis', harga: 350000, ikon: Icons.chair),
    const Produk(nama: 'Meja Kerja Kayu', harga: 750000, ikon: Icons.table_restaurant),
    const Produk(nama: 'Lampu Meja LED', harga: 120000, ikon: Icons.lightbulb),
    const Produk(nama: 'Rak Buku', harga: 450000, ikon: Icons.menu_book),
    const Produk(nama: 'Sofa Santai', harga: 2500000, ikon: Icons.weekend),
  ];

  void _snack(String pesan) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(pesan)));
  }

  void _tambahKeranjang(Produk p) {
    setState(() => _jumlahKeranjang++);
    _snack('${p.nama} ditambahkan ke keranjang');
  }

  Future<void> _bukaFormTambah() async {
    final baru = await Navigator.push<Produk>(
      context,
      MaterialPageRoute(builder: (context) => const TambahProdukPage()),
    );
    if (baru != null && mounted) {
      setState(() => _produk.add(baru));
      _snack('Produk "${baru.nama}" berhasil ditambahkan');
    }
  }

  Future<void> _konfirmasiHapus(Produk p) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Produk?'),
        content: Text('"${p.nama}" akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (yakin == true && mounted) {
      setState(() => _produk.remove(p));
      _snack('Produk "${p.nama}" telah dihapus');
    }
  }

  Widget _ikonKeranjang() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => _snack('Isi keranjang: $_jumlahKeranjang item'),
        ),
        if (_jumlahKeranjang > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text(
                '$_jumlahKeranjang',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final halaman = <Widget>[
      ProdukListPage(
        produk: _produk,
        onTambahKeranjang: _tambahKeranjang,
        onHapus: _konfirmasiHapus,
      ),
      const ProfilPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTerpilih == 0 ? 'Katalog Produk' : 'Profil'),
        actions: [_ikonKeranjang(), const SizedBox(width: 8)],
      ),
      body: halaman[_tabTerpilih],
      floatingActionButton: _tabTerpilih == 0
          ? FloatingActionButton(
              onPressed: _bukaFormTambah,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,
        onTap: (index) => setState(() => _tabTerpilih = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}