import 'package:flutter/material.dart';

class HargaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Daftar Harga',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        _buildHargaCard(
          imageAsset: 'Images/df1.png',
          title: 'Premium',
          subtitle: '1kg - Rp 10.000',
        ),
        _buildHargaCard(
          imageAsset: 'Images/df2.png',
          title: 'Cuci & Lipat',
          subtitle: '1kg - Rp 20.000',
        ),
        _buildHargaCard(
          imageAsset: 'Images/df3.png',
          title: 'Cuci & Setrika',
          subtitle: '1kg - Rp 30.000',
        ),
        _buildHargaCard(
          imageAsset: 'Images/df4.png',
          title: 'Cuci & Kering',
          subtitle: '1kg - Rp 40.000',
        ),
      ],
    );
  }

  Widget _buildHargaCard({
    required String imageAsset,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 300,
      child: Card(
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Image.asset(imageAsset),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
