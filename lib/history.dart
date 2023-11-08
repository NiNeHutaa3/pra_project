import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  // Contoh data riwayat pemesanan
  final List<Map<String, dynamic>> historyList = [
    {
      'tanggal': '20 Oktober 2023',
      'nama': 'John Doe',
      'nomor_pemesanan': '12345',
      'items': 'Cuci Lipat (10x T-shirt, 5x Jeans, 2x Jaket, 2x Kemeja)',
      'berat_barang': 'Berat Timbangan = 4kg',
      'harga_pembayaran': {
        'subtotal': 'Rp 700.000',
        'diskon': ' 30%',
        'total_pembayaran': 'Rp 600.000',
      },
    },
    {
      'tanggal': '18 Oktober 2023',
      'nama': 'Jane Smith',
      'nomor_pemesanan': '67890',
      'items': 'Cuci Lipat (8x T-shirt, 4x Jeans, 1x Jaket, 3x Kemeja)',
      'berat_barang': 'Berat Timbangan = 3kg',
      'harga_pembayaran': {
        'subtotal': 'Rp 600.000',
        'diskon': '20%',
        'total_pembayaran': 'Rp 520.000',
      },
    },
    // Tambahkan data riwayat pemesanan lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History Pemesanan',
          style: TextStyle(
            color: Color.fromARGB(255, 188, 95, 255), // Warna teks Status
          ),
        ), // Judul "Status"
        centerTitle: true, // Menempatkan teks judul di tengah
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan efek shadow
        iconTheme: IconThemeData(
            color: Color.fromARGB(255, 188, 95, 255)), // Warna icon
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          final historyItem = historyList[index];
          return GestureDetector(
            onTap: () {
              _showOrderDetailsDialog(context, historyItem);
            },
            child: Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Color.fromARGB(255, 236, 130, 255),
                  width: 2,
                ), // Warna border
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal: ${historyItem['tanggal']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Nama: ${historyItem['nama']}',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Nomor Pemesanan: ${historyItem['nomor_pemesanan']}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showOrderDetailsDialog(
      BuildContext context, Map<String, dynamic> historyItem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Detail Pemesanan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nomor Pemesanan: ${historyItem['nomor_pemesanan']}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Tanggal: ${historyItem['tanggal']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Items: ${historyItem['items']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Berat Barang: ${historyItem['berat_barang']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Harga Pembayaran',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Subtotal: ${historyItem['harga_pembayaran']['subtotal']}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Diskon: ${historyItem['harga_pembayaran']['diskon']}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Total Pembayaran: ${historyItem['harga_pembayaran']['total_pembayaran']}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(
      home: HistoryPage(),
    ));
