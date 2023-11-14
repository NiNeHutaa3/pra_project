import 'package:flutter/material.dart';
import 'Detail.dart';

class ProsesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama: John Doe',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'No. Pesanan: 1234586383',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Status: Selesai',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Waktu: 14:30',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('Images/ls_confirm 1.png'),
              Container(
                width: 40,
                height: 2,
                color: Colors.blue,
              ),
              Card(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(),
                          ),
                        );
                      },
                      child: Image.asset('Images/ls_pickup 1.png'),
                    ),
                    Container(
                      width: 40,
                      height: 2,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 2,
                color: Colors.blue,
              ),
              Image.asset('Images/ls_in_progress 1.png'),
              Container(
                width: 40,
                height: 2,
                color: Colors.blue,
              ),
              Image.asset('Images/Frame 228.png'),
              Container(
                width: 40,
                height: 2,
                color: Colors.blue,
              ),
              Image.asset('Images/Frame 229.png'),
            ],
          ),
        ],
      ),
    );
  }
}
