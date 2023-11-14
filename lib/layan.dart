import 'package:flutter/material.dart';
import 'package:pra_project/component/harga.dart';
import 'package:pra_project/component/pelayanan.dart';
import 'package:pra_project/component/tentang.dart';

class LayananPage extends StatefulWidget {
  const LayananPage({super.key});

  @override
  State<LayananPage> createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(248.0), // Sesuaikan tinggi vertikal di sini
          child: AppBar(
            backgroundColor: Colors.grey,
            elevation: 0,
            flexibleSpace: Container(
              height: 200.0, // Sesuaikan dengan tinggi vertikal yang diinginkan
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/form.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clean In',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16),
                    Text(
                      'Batam',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            bottom: TabBar(
              labelColor: Colors.white, // Atur warna teks tab yang dipilih
              unselectedLabelColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
              tabs: [
                Tab(text: 'Tentang'),
                Tab(text: 'Pelayanan'),
                Tab(text: 'Daftar Harga'),
              ],
              indicator: BoxDecoration(
                color: Colors.purple, // Warna tab yang dipilih (ungu)
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Isi konten tab "Tentang"
            TentangComponent(),
            // Isi konten tab "Pelayanan"
            ServiceComponent(),
            // Isi konten tab "Daftar Harga"
            HargaList()
          ],
        ),
      ),
    );
  }
}
