import 'package:flutter/material.dart';

class Hard8Screen extends StatefulWidget {
  const Hard8Screen({super.key});

  @override
  State<Hard8Screen> createState() => _Hard8ScreenState();
}

class _Hard8ScreenState extends State<Hard8Screen> {
  int _rows = 0;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 8: Pyramid Pattern')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number of rows (N)'),
              onChanged: (value) {
                setState(() {
                  _rows = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(_rows, (i) {
                    String rowText = '';
                    for (int j = 1; j <= i + 1; j++) {
                      rowText += '$j ';
                    }
                    return Text(
                      rowText.trim(),
                      style: const TextStyle(fontSize: 22, letterSpacing: 4, fontFamily: 'Courier'),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
