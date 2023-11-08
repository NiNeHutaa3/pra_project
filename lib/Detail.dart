import 'package:flutter/material.dart';
import 'Status.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pemesanan',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), // Warna teks Status
          ),
        ), // Judul "Status"
        centerTitle: true, // Menempatkan teks judul di tengah
        backgroundColor:
            Color.fromARGB(255, 191, 0, 255), // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan efek shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No. Pemesanan: 12345',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal: 20 Oktober 2023'),
                        Text('Waktu: 14:30'),
                      ],
                    ),
                    Divider(),
                    Text('Cuci & Setrika',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Item:'),
                    Text('10x T-shirt'),
                    Text('5x Jeans'),
                    Text('2x Jaket'),
                    Text('2x Kemeja'),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Berat Timbangan'),
                        Text('5 KG'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Harga Pembayaran:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Subtotal: \100.000',
                    ),
                    Text('Diskon: \10%'),
                    SizedBox(height: 8),
                    Text(
                      'Total: \90.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Tambahkan gambar dari folder assets
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        'Images/kirim.png', // Sesuaikan dengan path gambar Anda
                        width: 100, // Sesuaikan lebar gambar
                        height: 100, // Sesuaikan lebar gambar
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status Pemesanan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Barang Dalam Perjalanan',
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatusPage()),
                            );
                          },
                          child: Text(
                            'Lihat Pemesanan',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
