import 'package:flutter/material.dart';
import '../layan.dart';

class LayananComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Layanan',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 98, 97, 97),
              ),
            ),
          ),
        ),
        SizedBox(height: 7.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildServiceIcon(context, Icons.star, 'Premium'),
            _buildServiceIcon(
                context, Icons.local_laundry_service, 'Cuci Lipat'),
            _buildServiceIcon(context, Icons.iron, 'Cuci Setrika'),
            _buildServiceIcon(context, Icons.opacity, 'Cuci Kering'),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceIcon(
      BuildContext context, IconData iconData, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LayananPage()),
        );
      },
      child: Column(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 103, 179, 255),
            ),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 98, 97, 97),
            ),
          ),
        ],
      ),
    );
  }
}
