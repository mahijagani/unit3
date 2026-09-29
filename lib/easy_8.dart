import 'package:flutter/material.dart';

class Easy8Screen extends StatefulWidget {
  const Easy8Screen({super.key});

  @override
  State<Easy8Screen> createState() => _Easy8ScreenState();
}

class _Easy8ScreenState extends State<Easy8Screen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 8: Checkbox setState')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            Text(
              _isChecked ? 'Checked' : 'Unchecked',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
