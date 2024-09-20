import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        dialogBackgroundColor: Colors.purple,
      ),
      home: LoginPage(),
    );
  }
}

// Halaman Login
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == "karina" &&
        _passwordController.text == "123456") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Username atau Password salah!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 191, 226),
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: const Color.fromARGB(255, 64, 94, 109),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                iconColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Utama (Home Page)
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 191, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 94, 109),
        title: Text('Menu Utama'),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.group, color: Colors.teal),
              title: Text('Data Kelompok'),
              subtitle: Text('Lihat Identitas Pengguna'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataKelompokPage()),
                );
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.calculate, color: Colors.teal),
              title: Text('Penjumlahan dan Pengurangan'),
              subtitle: Text('Lakukan operasi matematika sederhana'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KalkulatorPage()),
                );
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.numbers, color: Colors.teal),
              title: Text('Cek Bilangan Ganjil/Genap'),
              subtitle: Text('Periksa apakah bilangan ganjil atau genap'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GanjilGenapPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Data Kelompok
class DataKelompokPage extends StatelessWidget {
  final List<Map<String, String>> anggota = [
    {
      'Nama': 'Tari Azari',
      'Nim': '124220001',
      'Telepon': '081234567890',
      'Hobi': ''
    },
    {'Nama': 'Azura Ananda', 'Nim': '124220003', 'Telepon': '081234567891'},
    {'Nama': 'Clara Simamora', 'Nim': '124220013', 'Telepon': '081234567892'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 191, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 94, 109),
        title: Text('Data Kelompok'),
      ),
      body: ListView.builder(
        itemCount: anggota.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(anggota[index]['Nama']!),
              subtitle: Text('Nim: ${anggota[index]['Nim']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailAnggotaPage(anggota: anggota[index])),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Halaman Detail Anggota
class DetailAnggotaPage extends StatelessWidget {
  final Map<String, String> anggota;

  DetailAnggotaPage({required this.anggota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 191, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 94, 109),
        title: Text(anggota['Nama']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  title: Text('Nama'),
                  subtitle: Text(anggota['Nama']!),
                ),
                ListTile(
                  title: Text('Nim'),
                  subtitle: Text(anggota['Nim']!),
                ),
                ListTile(
                  title: Text('Telepon'),
                  subtitle: Text(anggota['Telepon']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman Penjumlahan dan Pengurangan
class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);
    int result;

    if (operator == '+') {
      result = num1 + num2;
    } else {
      result = num1 - num2;
    }

    setState(() {
      _result = 'Hasil: $result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 191, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 94, 109),
        title: Text('Kalkulator Sederhana'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Angka Pertama'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Angka Kedua'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('Tambah'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text('Kurang'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// Halaman Cek Bilangan Ganjil/Genap
class GanjilGenapPage extends StatefulWidget {
  @override
  _GanjilGenapPageState createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _checkGanjilGenap() {
    int number = int.parse(_numberController.text);

    setState(() {
      if (number % 2 == 0) {
        _result = 'Bilangan Genap';
      } else {
        _result = 'Bilangan Ganjil';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 191, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 94, 109),
        title: Text('Cek Bilangan Ganjil/Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Angka'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkGanjilGenap,
              child: Text('Cek'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
