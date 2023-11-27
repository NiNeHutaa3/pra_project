import 'package:flutter/material.dart';
import 'package:pra_project/pembayaran.dart';
import 'package:pra_project/proses.dart';
import 'package:pra_project/selesai.dart';

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  int _selectedTabIndex = 0;

  final List<String> tabTitles = ['Proses', 'Pembayaran', 'Selesai'];

  bool cashViaCourier = false;
  bool transferBank = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Status',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), // Warna teks Status
          ),
        ), // Judul "Status"
        centerTitle: true, // Menempatkan teks judul di tengah
        backgroundColor: const Color.fromARGB(
            255, 191, 0, 255), // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan efek shadow
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            height: 100, // Tinggi TabBar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 40, // Lebar Tab
                        height: 40, // Tinggi Tab
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedTabIndex == index
                              ? Color.fromARGB(255, 209, 131, 255)
                              : Colors.grey,
                        ),
                        child: Icon(
                          index == 0
                              ? Icons.track_changes
                              : index == 1
                                  ? Icons.payment
                                  : Icons.check_circle,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        tabTitles[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _selectedTabIndex == 0
                    ? ProsesPage()
                    : _selectedTabIndex == 1
                        ? PembayaranPage()
                        : SelesaiPage()),
          ),
        ],
      ),
    );
  }
}
