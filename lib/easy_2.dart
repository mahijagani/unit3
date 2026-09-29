import 'package:flutter/material.dart';

class Easy2Screen extends StatelessWidget {
  const Easy2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('Easy 2: ListTile Icon')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.star),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
