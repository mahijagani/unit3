import 'package:flutter/material.dart';

class Easy1Screen extends StatelessWidget {
  const Easy1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Alice', 'Bob', 'Charlie', 'Diana', 'Ethan',
      'Fiona', 'George', 'Hannah', 'Ian', 'Julia'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Easy 1: ListView Names')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              names[index],
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
