import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          SizedBox(height: 12),
          Text('Reinhard Jeremia Lubis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('42325033 - Pengembangan Aplikasi Mobile'),
        ],
      ),
    );
  }
}




