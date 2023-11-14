import 'package:flutter/material.dart';

class SelesaiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ListView(
          children: const <Widget>[
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama Pelanggan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('John Doe'),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nomor Pemesanan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('12345'),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jumlah Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('\50.000'),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tanggal & Waktu Pengembalian',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('2023-10-16 14:00'),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Kartu Kredit'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
