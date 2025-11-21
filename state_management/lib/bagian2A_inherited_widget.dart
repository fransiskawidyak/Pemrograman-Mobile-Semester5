import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  final int counter;
  final VoidCallback onIncrement;

  const CounterInheritedWidget({
    super.key,
    required this.counter,
    required this.onIncrement,
    required Widget child,
  }) : super(child: child);

  static CounterInheritedWidget of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
    assert(result != null, 'No CounterInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }
}

class InheritedWidgetExample extends StatefulWidget {
  const InheritedWidgetExample({super.key});

  @override
  State<InheritedWidgetExample> createState() =>
      _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      counter: counter,
      onIncrement: incrementCounter,
      child: Scaffold(
        appBar: AppBar(title: const Text("Bagian 2A: InheritedWidget")),
        body: const Center(child: CounterDisplay()),
        floatingActionButton: FloatingActionButton(
          onPressed: incrementCounter,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CounterInheritedWidget.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Counter dari InheritedWidget:"),
        Text(provider.counter.toString(),
            style: const TextStyle(fontSize: 40)),
      ],
    );
  }
}
