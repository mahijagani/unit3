import 'package:flutter/material.dart';

class Easy4HomeScreen extends StatelessWidget {
  const Easy4HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 4: Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Easy4SecondScreen()),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class Easy4SecondScreen extends StatelessWidget {
  const Easy4SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 4: Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
