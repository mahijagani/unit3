import 'package:flutter/material.dart';

class Moderate10Screen extends StatefulWidget {
  const Moderate10Screen({super.key});

  @override
  State<Moderate10Screen> createState() => _Moderate10ScreenState();
}

class _Moderate10ScreenState extends State<Moderate10Screen> {
  int _rows = 0;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mod 10: Star Pattern')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number of rows'),
              onChanged: (value) {
                setState(() {
                  _rows = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _rows,
                itemBuilder: (context, index) {
                  return Text('* ' * (index + 1), style: const TextStyle(fontSize: 20));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
