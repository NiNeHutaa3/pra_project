import 'package:flutter/material.dart';

class TentangComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          _buildSectionTitle('Tentang'),
          _buildDescription(
            'Ini adalah penjelasan tentang kami dan apa yang kami lakukan. Jika desain responsif adalah tipe Anda, halaman tentang kami Upkey akan memberi Anda banyak ide. Situs web ini berfokus pada mempersiapkan siswa untuk kehidupan profesional, jadi ini harus menjadi satu halaman yang menarik. Dan itu tidak mengecewakan.',
          ),
          SizedBox(height: 16),
          _buildSectionTitle('Alamat'),
          _buildDescription('Jl. Contoh No. 123, Kota Contoh'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
