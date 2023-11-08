import 'package:flutter/material.dart';
import 'layan.dart';
import 'history.dart';
import 'Detail.dart';

void main() {
  runApp(LaundryApp());
}

class LaundryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laundry App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    StatusTab(),
    NotificationsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Menghilangkan app bar
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 150.0, // Lebar header dapat diatur
          padding: EdgeInsets.all(16.0), // Padding dalam header
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFBC5FFF), Color(0xFF7647FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Clean In',
                  style: TextStyle(
                    color: Color.fromARGB(255, 231, 151, 255),
                    fontSize: 24.0,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, user',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Lokasi Anda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Batam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // Konten lainnya di bawah header
        // Judul "Layanan" (semibold, hitam)
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.only(
              left: 8.0), // Sesuaikan nilai left sesuai kebutuhan Anda
          child: Text(
            'Layanan',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 98, 97, 97),
            ),
          ),
        ),

        SizedBox(height: 16.0), // Jarak antara judul dan ikon

        // Empat ikon dengan judul dalam lingkaran
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
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.only(
              left: 8.0), // Sesuaikan nilai left sesuai kebutuhan Anda
          child: Text(
            'Penawaran',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 98, 97, 97),
            ),
          ),
        ),

        SizedBox(height: 16.0), // Jarak antara judul "Penawaran" dan card

        // Card dengan gambar dan judul singkat (contoh)
        SizedBox(
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildOfferCard(
                'Images/baju.jpg',
                'Judul 1',
              ),
              _buildOfferCard(
                'Images/jemur.jpg',
                'Judul 2',
              ),
              _buildOfferCard(
                'Images/setrika.jpg',
                'Judul 3',
              ),
            ],
          ),
        ),

        // Judul "Paket Khusus" (semibold, hitam)
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.only(
              left: 8.0), // Sesuaikan nilai left sesuai kebutuhan Anda
          child: Text(
            'Paket Khusus',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 98, 97, 97),
            ),
          ),
        ),

        SizedBox(height: 16.0), // Jarak antara judul "Paket Khusus" dan card

        // Card dengan harga diskon (contoh)
        SizedBox(
          height: 120.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 280.0, // Atur lebar card
                child: _buildSpecialPackageCard(
                  'Terbatas',
                  'Diskon 20%',
                  'Images/gambar_paket_1.png',
                  const Color.fromARGB(255, 93, 182, 255),
                ),
              ),
              Container(
                width: 280.0, // Atur lebar card
                child: _buildSpecialPackageCard(
                  'Diskon Meriah',
                  'Diskon 35%',
                  'Images/gambar_paket_2.png',
                  const Color.fromARGB(255, 93, 182, 255),
                ),
              ),
              Container(
                width: 280.0, // Atur lebar card
                child: _buildSpecialPackageCard(
                  'Paket 3',
                  'Diskon 10%',
                  'Images/gambar_paket_1.png',
                  const Color.fromARGB(255, 93, 182, 255),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget untuk membuat ikon layanan dalam lingkaran
Widget _buildServiceIcon(BuildContext context, IconData icon, String title) {
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
          width: 50.0, // Lebar lingkaran
          height: 50.0, // Tinggi lingkaran
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(
                255, 103, 179, 255), // Warna latar belakang lingkaran
          ),
          child: Icon(
            icon,
            color: Colors.white, // Warna ikon putih
            size: 30.0, // Ukuran ikon
          ),
        ),
        SizedBox(height: 8.0), // Jarak antara ikon dan judul
        Text(
          title,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 98, 97, 97),
          ),
        ),
      ],
    ),
  );
}

Widget _buildOfferCard(String image, String title) {
  return Card(
    margin: EdgeInsets.all(8.0),
    child: Column(
      children: [
        Image.asset(
          image,
          width: 250.0,
          height: 150.0,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

// Widget untuk membuat card paket khusus
Widget _buildSpecialPackageCard(
    String package, String discountPrice, String imagePath, Color cardColor) {
  return Card(
    margin: EdgeInsets.all(8.0),
    color: Colors.transparent, // Hapus warna latar belakang card
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 105, 209, 254),
            Color.fromARGB(255, 221, 140, 255)
          ], // Warna ungu gradiasi
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          // Bagian kiri card (gambar)
          Container(
            width: 70.0, // Lebar bagian kiri (gambar)
            height: 70.0, // Tinggi bagian kiri (gambar)
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Padding gambar
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath), // Memuat gambar dari path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Bagian kanan card (teks)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                  Text(
                    discountPrice,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan aksi yang ingin Anda lakukan ketika tombol Klaim ditekan
                      },
                      child: Text('Klaim'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

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
        title: Text(
          'Status',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), // Warna teks Status
          ),
        ), // Judul "Status"
        centerTitle: true, // Menempatkan teks judul di tengah
        backgroundColor:
            Color.fromARGB(255, 191, 0, 255), // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan efek shadow
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
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
                        duration: Duration(milliseconds: 300),
                        width: 40, // Lebar Tab
                        height: 40, // Tinggi Tab
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedTabIndex == index
                              ? Colors.blue
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
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: _selectedTabIndex == 0
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Untuk mengatur posisi sejajar
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
                          SizedBox(height: 20),
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
                                              builder: (context) =>
                                                  DetailPage()),
                                        );
                                      },
                                      child:
                                          Image.asset('Images/ls_pickup 1.png'),
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
                    )
                  : _selectedTabIndex == 1
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 202, 120, 246),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      margin: EdgeInsets.all(10.0),
                                      child: Padding(
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
                                          color: Color.fromARGB(
                                              255, 202, 120, 246),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      margin: EdgeInsets.all(10.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
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
                                          hint: Text('Klaim Voucher'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 202, 120, 246),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      margin: EdgeInsets.all(10.0),
                                      child: Padding(
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
                              Text(
                                'Metode Pembayaran:',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 202, 120, 246),
                                    width: 1.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                margin: EdgeInsets.all(10.0),
                                child: CheckboxListTile(
                                  title: Text('Cash melalui kurir'),
                                  value: cashViaCourier,
                                  onChanged: (bool) {
                                    setState(() {
                                      cashViaCourier;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 202, 120, 246),
                                    width: 1.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                margin: EdgeInsets.all(10.0),
                                child: CheckboxListTile(
                                  title: Text('Transfer Bank'),
                                  value: transferBank,
                                  onChanged: (bool) {
                                    setState(() {
                                      transferBank;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Container(
                            margin: EdgeInsets.all(16.0),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nama Pelanggan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('John Doe'),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nomor Pemesanan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('12345'),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jumlah Pembayaran',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('\50.000'),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tanggal & Waktu Pengembalian',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('2023-10-16 14:00'),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Metode Pembayaran',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Kartu Kredit'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: TextStyle(
            color: Color.fromARGB(255, 188, 95, 255),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationCard(
            message: 'Pesanan Anda Diterima',
          ),
          NotificationCard(
            message: 'Pesanan Anda Siap',
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String message;

  NotificationCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: Text(
              'Waktu: 10:00 AM', // Ganti dengan waktu sesuai kebutuhan Anda
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(
                  'Images/foto_profile.png'), // Ganti dengan path foto profil Anda
            ),
          ),
          // Bagian nama pengguna
          Container(
            alignment: Alignment.center,
            child: Column(
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
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Account Setting',
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 177, 162, 162),
              ),
            ),
          ),
          // Daftar menu pengaturan akun
          ListTile(
            leading: Icon(Icons.location_on), // Icon alamat
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Alamat'), // Teks menu alamat
                InkWell(
                  onTap: () {
                    // Tambahkan aksi yang ingin Anda lakukan ketika ikon edit ditekan
                  },
                  child: Icon(Icons.edit), // Ikon edit
                ),
              ],
            ),
            subtitle: Text(
                'Arse indah Blok C no 2 bro'), // Ganti dengan alamat pengguna Anda
            onTap: () {
              // Tambahkan aksi yang ingin Anda lakukan ketika menu alamat ditekan
            },
          ),

          ListTile(
            leading: Icon(Icons.feedback), // Icon umpan balik
            title: Text('Umpan Balik'), // Teks menu umpan balik
            onTap: () {
              _showFeedbackDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag), // Icon history belanja
            title: Text('History Pesanan'), // Teks menu history belanja
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app), // Icon logout
            title: Text('Logout'), // Teks menu logout
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
            Text('Tulis Saran dan kritik Anda'),
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
            child: Text('Kirim'),
          ),
        ],
      );
    },
  );
}
