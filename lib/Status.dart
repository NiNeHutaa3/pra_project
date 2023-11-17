import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), // Warna teks Status
          ),
        ), // Judul "Status"// Menempatkan teks judul di tengah
        backgroundColor:
            Color.fromARGB(255, 191, 0, 255), // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan efek shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('No. Pemesanan: 12345',
                    style: TextStyle(
                      fontSize: 15,
                    )),
                Text('Total Harga: \90.000',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ],
            ),
            SizedBox(height: 18),
            Text(
              'Status Pemesanan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                StatusItem(
                  image:
                      'Images/ls_confirm 1.png', // Ganti dengan path gambar pertama
                  text1: 'Konfirmasi',
                  text2: 'Barang kamu telah dikonfirmasi',
                  time: '08:00 AM',
                ),
                StatusItem(
                  image:
                      'Images/ls_pickup 1.png', // Ganti dengan path gambar kedua
                  text1: 'Dijemput',
                  text2: 'Barang kamu telah dijemput',
                  time: '09:00 AM',
                ),
                StatusItem(
                  image:
                      'Images/ls_in_progress 1.png', // Ganti dengan path gambar ketiga
                  text1: 'Proses',
                  text2: 'Barang kamu dalam proses',
                  time: '10:00 AM',
                ),
                StatusItem(
                  image:
                      'Images/Frame 228.png', // Ganti dengan path gambar keempat
                  text1: 'Pengiriman',
                  text2: 'Barang kamu dalam pengiriman',
                  time: '11:00 AM',
                ),
                StatusItem(
                  image:
                      'Images/Frame 229.png', // Ganti dengan path gambar kelima
                  text1: 'Konfirmasi',
                  text2: 'Barang kamu telah dikonfirmasi',
                  time: '12:00 PM',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  final String time;

  StatusItem({
    required this.image,
    required this.text1,
    required this.text2,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 60,
          height: 60,
        ),
        Divider(
          // Tambahkan Divider di sini
          color: Colors.black, // Atur warna garis sesuai kebutuhan
          height: 60, // Sesuaikan tinggi garis sesuai kebutuhan
          thickness: 1, // Sesuaikan ketebalan garis sesuai kebutuhan
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1),
            Text(text2),
          ],
        ),
        Spacer(),
        Text(time),
      ],
    );
  }
}
