import 'package:flutter/material.dart';

class Mod4HomeScreen extends StatelessWidget {
  const Mod4HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mod 4: Receive Data Back')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Mod4DetailScreen()),
            );
            if (context.mounted && result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Received: $result')),
              );
            }
          },
          child: const Text('Go to Detail Screen'),
        ),
      ),
    );
  }
}

class Mod4DetailScreen extends StatelessWidget {
  const Mod4DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'Hello from Detail Screen!');
          },
          child: const Text('Send "Hello" Back'),
        ),
      ),
    );
  }
}
