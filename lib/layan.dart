import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayananPage(),
    );
  }
}

class LayananPage extends StatefulWidget {
  @override
  _LayananPageState createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
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

    if (picked != null) {
      if (isPickup) {
        selectedPickupDate = picked;
        updatePickupDateTimeController();
      } else {
        selectedDeliveryDate = picked;
        updateDeliveryDateTimeController();
      }
    }
  }

  Future<void> _selectTime(BuildContext context, bool isPickup) async {
    final TimeOfDay picked = (await showTimePicker(
          context: context,
          initialTime: isPickup ? selectedPickupTime : selectedDeliveryTime,
        )) ??
        TimeOfDay.now();

    if (picked != null) {
      if (isPickup) {
        selectedPickupTime = picked;
        updatePickupDateTimeController();
      } else {
        selectedDeliveryTime = picked;
        updateDeliveryDateTimeController();
      }
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Tentang',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Ini adalah penjelasan tentang kami dan apa yang kami lakukan.Jika desain responsif adalah tipe Anda, halaman tentang kami Upkey akan memberi Anda banyak ide.Situs web ini berfokus pada mempersiapkan siswa untuk kehidupan profesional, jadi ini harus menjadi satu halaman yang menarik. Dan itu tidak mengecewakan.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Alamat',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Jl. Contoh No. 123, Kota Contoh',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // Isi konten tab "Pelayanan"
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Padding kiri dan kanan
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Pelayanan',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                        labelText: 'Metode Pencucian',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Basah', 'Kering'].map((String method) {
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
                      items: ['Detergen A', 'Detergen B', 'Detergen C']
                          .map((String detergent) {
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
                          primary: Colors.purple, // Warna latar belakang tombol
                          onPrimary: Colors.white, // Warna teks tombol
                        ),
                        child: Text('Kirim'),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Isi konten tab "Daftar Harga"
            ListView(
              children: <Widget>[
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Daftar Harga',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300, // Atur lebar Card sesuai kebutuhan Anda
                  child: Card(
                    margin: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Image.asset('Images/df1.png'),
                      title: Text('Premium'),
                      subtitle: Text('1kg - Rp 10.000'),
                    ),
                  ),
                ),
                Container(
                  width: 300, // Atur lebar Card sesuai kebutuhan Anda
                  child: Card(
                    margin: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Image.asset('Images/df2.png'),
                      title: Text('Cuci & Lipat'),
                      subtitle: Text('1kg - Rp 20.000'),
                    ),
                  ),
                ),
                Container(
                  width: 300, // Atur lebar Card sesuai kebutuhan Anda
                  child: Card(
                    margin: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Image.asset('Images/df3.png'),
                      title: Text('Cuci & Setrika'),
                      subtitle: Text('1kg - Rp 30.000'),
                    ),
                  ),
                ),
                Container(
                  width: 300, // Atur lebar Card sesuai kebutuhan Anda
                  child: Card(
                    margin: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Image.asset('Images/df4.png'),
                      title: Text('Cuci & Kering'),
                      subtitle: Text('1kg - Rp 40.000'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
