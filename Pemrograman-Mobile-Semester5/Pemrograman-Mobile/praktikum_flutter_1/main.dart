import 'package:flutter/material.dart';

void main() {
  runApp(Percobaan1());
}

class Percobaan1 extends StatelessWidget {
  const Percobaan1({Key? key}) : super(key: key); // Tambah constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Percobaan Flutter Pertama"),
          centerTitle: true,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            "Hello World dari Flutter!",
            style: TextStyle(fontSize: 24, color: Colors.purple),
          ),
        ),
      ),
    );
  } 
}