import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class Easy9Screen extends StatelessWidget {
  const Easy9Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Easy 9: Provider Consumer')),
        body: Center(
          child: Consumer<CounterModel>(
            builder: (context, model, child) {
              return Text('Counter: ${model.counter}', style: const TextStyle(fontSize: 24));
            },
          ),
        ),
        floatingActionButton: Consumer<CounterModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: model.increment,
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
