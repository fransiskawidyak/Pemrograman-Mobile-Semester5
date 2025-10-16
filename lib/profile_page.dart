import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7F6),
      appBar: AppBar(
        title: const Text('Profil Fransiska Widya Krisanti'),
        backgroundColor: const Color(0xFF7B3FBF),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Foto profil
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/fransiska.jpg'),
            ),
            const SizedBox(height: 16),

            // Nama dan info
            const Text(
              'Fransiska Widya Krisanti',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A148C),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mahasiswa Teknologi Informasi',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Text(
              'Politeknik Negeri Malang',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 40),

            // Counter
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B3FBF),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol-tombol counter
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _resetCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),

            // 🔹 Tambahan: Logo Polinema dan Tulisan
            const SizedBox(height: 40),
            Column(
              children: [
                Image.asset(
                  'assets/polinema.jpg',
                  width: 90,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Politeknik Negeri Malang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7B3FBF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
