import 'package:flutter/material.dart';

class CounterModel {
  int value = 0;

  void increment() {
    value++;
  }
}

class CounterController extends ChangeNotifier {
  final CounterModel _model = CounterModel();

  int get counter => _model.value;

  void incrementCounter() {
    _model.increment();
    notifyListeners();
  }
}

class MyMVCApp extends StatelessWidget {
  const MyMVCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVC Example",
      home: MVCView(),
    );
  }
}

class MVCView extends StatefulWidget {
  @override
  State<MVCView> createState() => _MVCViewState();
}

class _MVCViewState extends State<MVCView> {
  final controller = CounterController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bagian 1: MVC Concept")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Angka Counter:", style: TextStyle(fontSize: 20)),
            Text("${controller.counter}",
                style: const TextStyle(fontSize: 40)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
