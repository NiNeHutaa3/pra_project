import 'package:flutter/material.dart';
import '../layan1.dart';
import '../layan2.dart';
import '../layan3.dart';

class LayananComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Judul Layanan',
            style: TextStyle(
              fontSize: 16.0, // Ukuran judul lebih kecil
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 98, 97, 97),
            ),
          ),
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LayananIcon(
              icon: Icons.star,
              label: 'Premium',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LayananPage()),
                );
              },
            ),
            LayananIcon(
              icon: Icons.local_laundry_service,
              label: 'Cuci Setrika',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LayananPage()),
                );
              },
            ),
            LayananIcon(
              icon: Icons.iron,
              label: 'Setrika',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LayananPage2()),
                );
              },
            ),
            LayananIcon(
              icon: Icons.star_border,
              label: 'Khusus',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LayananPage3()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class LayananIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  LayananIcon({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            padding: EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(label),
        ],
      ),
    );
  }
}
