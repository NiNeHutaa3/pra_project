import 'package:flutter/material.dart';

class PembayaranPage extends StatelessWidget {
  final bool cashViaCourier;
  final bool transferBank;

  PembayaranPage({
    required this.cashViaCourier,
    required this.transferBank,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 202, 120, 246),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Subtotal: \100.000',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 202, 120, 246),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: <String>[
                        'Voucher 1',
                        'Voucher 2',
                        'Voucher 3',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String) {
                        // Implementasi perubahan nilai dropdown di sini
                      },
                      hint: const Text('Klaim Voucher'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 202, 120, 246),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Total Harga: \50.000',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Metode Pembayaran:',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 202, 120, 246),
                width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            margin: const EdgeInsets.all(10.0),
            child: CheckboxListTile(
              title: const Text('Cash melalui kurir'),
              value: cashViaCourier,
              onChanged: (bool) {
                // Implement the logic to handle the checkbox state
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 202, 120, 246),
                width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            margin: const EdgeInsets.all(10.0),
            child: CheckboxListTile(
              title: const Text('Transfer Bank'),
              value: transferBank,
              onChanged: (bool) {
                // Implement the logic to handle the checkbox state
              },
            ),
          ),
        ],
      ),
    );
  }
}
