import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners(); // memberitahu widget bahwa data berubah
  }
}

class CounterProvider extends InheritedNotifier<CounterNotifier> {
  const CounterProvider({
    super.key,
    required CounterNotifier notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);

  static CounterNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterProvider>()!
        .notifier!;
  }
}


class InheritedNotifierExample extends StatefulWidget {
  const InheritedNotifierExample({super.key});

  @override
  State<InheritedNotifierExample> createState() =>
      _InheritedNotifierExampleState();
}

class _InheritedNotifierExampleState
    extends State<InheritedNotifierExample> {
  final CounterNotifier notifier = CounterNotifier();

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      notifier: notifier,
      child: Scaffold(
        appBar: AppBar(title: const Text("Bagian 2B: InheritedNotifier")),
        body: const Center(child: CounterDisplay2B()),
        floatingActionButton: FloatingActionButton(
          onPressed: notifier.increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterDisplay2B extends StatelessWidget {
  const CounterDisplay2B({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = CounterProvider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Counter dari InheritedNotifier:"),
        Text(
          notifier.value.toString(),
          style: const TextStyle(fontSize: 40),
        ),
      ],
    );
  }
}
