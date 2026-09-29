import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

class Easy10Screen extends StatelessWidget {
  const Easy10Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Easy 10: read vs watch')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WatchWidget(),
              const SizedBox(height: 20),
              const ReadButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class WatchWidget extends StatelessWidget {
  const WatchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // context.watch() makes this widget rebuild when count changes
    final count = context.watch<CounterProvider>().count;
    return Text('Count (watched): $count', style: const TextStyle(fontSize: 20));
  }
}

class ReadButton extends StatelessWidget {
  const ReadButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // context.read() is used for actions, doesn't cause rebuilds
        context.read<CounterProvider>().increment();
      },
      child: const Text('Increment (read)'),
    );
  }
}
