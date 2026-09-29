import 'package:flutter/material.dart';

class Easy5App extends StatelessWidget {
  const Easy5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Easy5Home(),
        '/about': (context) => const Easy5About(),
        '/contact': (context) => const Easy5Contact(),
      },
    );
  }
}

class Easy5Home extends StatelessWidget {
  const Easy5Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('Go to About')),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/contact'), child: const Text('Go to Contact')),
          ],
        ),
      ),
    );
  }
}

class Easy5About extends StatelessWidget {
  const Easy5About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Center(child: Text('About Screen')),
    );
  }
}

class Easy5Contact extends StatelessWidget {
  const Easy5Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: const Center(child: Text('Contact Screen')),
    );
  }
}
