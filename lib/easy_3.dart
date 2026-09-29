import 'package:flutter/material.dart';

class Easy3Screen extends StatelessWidget {
  const Easy3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red, Colors.green, Colors.blue,
      Colors.yellow, Colors.orange, Colors.purple
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Easy 3: GridView Colors')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            color: colors[index],
          );
        },
      ),
    );
  }
}
