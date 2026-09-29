import 'package:flutter/material.dart';

class Moderate9Screen extends StatefulWidget {
  const Moderate9Screen({super.key});

  @override
  State<Moderate9Screen> createState() => _Moderate9ScreenState();
}

class _Moderate9ScreenState extends State<Moderate9Screen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mod 9: Star Rating')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            Text('Rating: $_rating / 5', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
