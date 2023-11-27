import 'package:flutter/material.dart';

class PembayaranPage extends StatefulWidget {
  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  bool isPaymentMethod1Selected = false;
  bool isPaymentMethod2Selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SubTotal Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SubTotal Harga',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Add your subtotal amount here
                    Text(
                      'Rp 100.000',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Judul "Metode Pembayaran"
            Text(
              'Metode Pembayaran',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            // Box dengan Text dan Checkbox untuk Pembayaran 1
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cash Melalui Kurir',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: isPaymentMethod1Selected,
                    onChanged: (value) {
                      setState(() {
                        isPaymentMethod1Selected = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Box dengan Text dan Checkbox untuk Pembayaran 2
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transfer Bank',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: isPaymentMethod2Selected,
                    onChanged: (value) {
                      setState(() {
                        isPaymentMethod2Selected = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
