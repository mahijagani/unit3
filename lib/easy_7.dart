import 'package:flutter/material.dart';

class Easy7Screen extends StatefulWidget {
  const Easy7Screen({super.key});

  @override
  State<Easy7Screen> createState() => _Easy7ScreenState();
}

class _Easy7ScreenState extends State<Easy7Screen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 7: Counter (+/-)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $_counter', style: const TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _counter++),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => setState(() => _counter--),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
