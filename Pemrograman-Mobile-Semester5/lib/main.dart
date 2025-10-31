import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile & Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD7BCE8)),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _counter = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      const ProfilePage(),
      CounterPage(
        getCounter: () => _counter,
        increment: _incrementCounter,
        decrement: _decrementCounter,
        reset: _resetCounter,
        addFive: _addFive,
      ),
    ]);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _addFive() {
    setState(() {
      _counter += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5FF),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFFEADCF8),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple.shade200,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.countertops),
            label: 'Counter',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: const Color(0xFFD7BCE8),
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Profil Mahasiswa',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 60,
            backgroundImage: const AssetImage('assets/fransiska.jpg'),
            backgroundColor: Colors.purple.shade100,
          ),
          const SizedBox(height: 20),
          Text(
            'Fransiska Widya Krisanti',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'NIM: 2341760101',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Jurusan: D4 - Teknologi Informasi',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Prodi: Sistem Informasi Bisnis (SIB)',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  final Function() increment;
  final Function() decrement;
  final Function() reset;
  final Function() addFive;
  final int Function() getCounter;

  const CounterPage({
    super.key,
    required this.increment,
    required this.decrement,
    required this.reset,
    required this.addFive,
    required this.getCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F5FF),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hitung Tekanan Tombol',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${getCounter()}',
            style: GoogleFonts.poppins(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrement,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.remove, color: Colors.deepPurple),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: increment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade200,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Tombol tambahan
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Reset', style: TextStyle(color: Colors.deepPurple)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: addFive,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('+5', style: TextStyle(color: Colors.deepPurple)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
