import 'package:flutter/material.dart';
import 'history.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Color.fromARGB(255, 188, 95, 255), // Warna teks Status
          ),
        ), // Judul "Status"
        centerTitle: true, // Menempatkan teks judul di tengah
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan efek shadow
      ),
      body: ListView(
        children: [
          // Bagian foto profil
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: const CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(
                  'Images/foto_profile.png'), // Ganti dengan path foto profil Anda
            ),
          ),
          // Bagian nama pengguna
          Container(
            alignment: Alignment.center,
            child: const Column(
              children: [
                Text(
                  'Nama Pengguna', // Ganti dengan nama pengguna Anda
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Batam, Kepulauan Riau',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Judul "Account Setting"
          const SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: const Text(
              'Account Setting',
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 177, 162, 162),
              ),
            ),
          ),
          // Daftar menu pengaturan akun
          ListTile(
            leading: const Icon(Icons.location_on), // Icon alamat
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Alamat'), // Teks menu alamat
                InkWell(
                  onTap: () {
                    // Tambahkan aksi yang ingin Anda lakukan ketika ikon edit ditekan
                  },
                  child: const Icon(Icons.edit), // Ikon edit
                ),
              ],
            ),
            subtitle: const Text(
                'Arse indah Blok C no 2 bro'), // Ganti dengan alamat pengguna Anda
            onTap: () {
              // Tambahkan aksi yang ingin Anda lakukan ketika menu alamat ditekan
            },
          ),

          ListTile(
            leading: const Icon(Icons.feedback), // Icon umpan balik
            title: const Text('Umpan Balik'), // Teks menu umpan balik
            onTap: () {
              _showFeedbackDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag), // Icon history belanja
            title: const Text('History Pesanan'), // Teks menu history belanja
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app), // Icon logout
            title: const Text('Logout'), // Teks menu logout
            onTap: () {
              // Tambahkan aksi yang ingin Anda lakukan ketika menu logout ditekan
            },
          ),
        ],
      ),
    );
  }
}

void _showFeedbackDialog(BuildContext context) {
  String feedbackText = ''; // Variabel untuk menyimpan pesan umpan balik

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Tulis Saran dan kritik Anda'),
            TextField(
              onChanged: (text) {
                feedbackText = text;
              },
              maxLines: 5,
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk mengirim pesan umpan balik
              // Misalnya, mengirim pesan ke server atau tempat penyimpanan
              print('Mengirim pesan umpan balik: $feedbackText');
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: const Text('Kirim'),
          ),
        ],
      );
    },
  );
}
