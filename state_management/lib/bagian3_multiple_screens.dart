import 'package:flutter/material.dart';


class CounterNotifier extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
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


class Screen1 extends StatelessWidget {
  final CounterNotifier notifier;

  const Screen1({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      notifier: notifier,
      child: Scaffold(
        appBar: AppBar(title: const Text("Screen 1")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Counter saat ini:"),
              Text(
                notifier.value.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Screen2(notifier: notifier),
                    ),
                  );
                },
                child: const Text("Ke Screen 2"),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: notifier.increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


class Screen2 extends StatelessWidget {
  final CounterNotifier notifier;

  const Screen2({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      notifier: notifier,
      child: Scaffold(
        appBar: AppBar(title: const Text("Screen 2")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Counter dari Screen 2:"),
              Text(
                notifier.value.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kembali ke Screen 1"),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: notifier.increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
