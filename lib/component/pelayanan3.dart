import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceComponent extends StatefulWidget {
  @override
  _ServiceComponentState createState() => _ServiceComponentState();
}

class _ServiceComponentState extends State<ServiceComponent> {
  DateTime selectedPickupDate = DateTime.now();
  TimeOfDay selectedPickupTime = TimeOfDay.now();
  DateTime selectedDeliveryDate = DateTime.now();
  TimeOfDay selectedDeliveryTime = TimeOfDay.now();
  TextEditingController pickupDateTimeController = TextEditingController();
  TextEditingController deliveryDateTimeController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isPickup) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: isPickup ? selectedPickupDate : selectedDeliveryDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        )) ??
        DateTime.now();

    if (isPickup) {
      selectedPickupDate = picked;
      updatePickupDateTimeController();
    } else {
      selectedDeliveryDate = picked;
      updateDeliveryDateTimeController();
    }
  }

  Future<void> _selectTime(BuildContext context, bool isPickup) async {
    final TimeOfDay picked = (await showTimePicker(
          context: context,
          initialTime: isPickup ? selectedPickupTime : selectedDeliveryTime,
        )) ??
        TimeOfDay.now();

    if (isPickup) {
      selectedPickupTime = picked;
      updatePickupDateTimeController();
    } else {
      selectedDeliveryTime = picked;
      updateDeliveryDateTimeController();
    }
  }

  void updatePickupDateTimeController() {
    final formattedDate = DateFormat.yMd().format(selectedPickupDate);
    final formattedTime = selectedPickupTime.format(context);
    pickupDateTimeController.text = '$formattedDate $formattedTime';
  }

  void updateDeliveryDateTimeController() {
    final formattedDate = DateFormat.yMd().format(selectedDeliveryDate);
    final formattedTime = selectedDeliveryTime.format(context);
    deliveryDateTimeController.text = '$formattedDate $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Pelayanan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
                hintText: 'Masukkan nama Anda',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Pilihan',
                border: OutlineInputBorder(),
              ),
              items:
                  ['Selimut & Seprai', 'Karpet', 'Boneka'].map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String) {
                // Handle value change
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Jenis Detergen',
                border: OutlineInputBorder(),
              ),
              items: ['Cair', 'Bubuk'].map((String detergent) {
                return DropdownMenuItem<String>(
                  value: detergent,
                  child: Text(detergent),
                );
              }).toList(),
              onChanged: (String) {
                // Handle value change
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
                hintText: 'Masukkan alamat Anda',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: pickupDateTimeController,
              decoration: InputDecoration(
                labelText: 'Tanggal dan Waktu Penjemputan',
                border: OutlineInputBorder(),
                hintText: 'Pilih tanggal dan waktu',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                _selectDate(context, true);
                _selectTime(context, true);
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: deliveryDateTimeController,
              decoration: InputDecoration(
                labelText: 'Tanggal dan Waktu Pengiriman',
                border: OutlineInputBorder(),
                hintText: 'Pilih tanggal dan waktu',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                _selectDate(context, false);
                _selectTime(context, false);
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button click
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                ),
                child: Text('Kirim'),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
