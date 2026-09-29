import 'package:flutter/material.dart';

class Hard5Screen extends StatefulWidget {
  const Hard5Screen({super.key});

  @override
  State<Hard5Screen> createState() => _Hard5ScreenState();
}

class _Hard5ScreenState extends State<Hard5Screen> {
  bool _isGridView = false;
  final List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hard 5: Toggle View'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _isGridView = !_isGridView),
          ),
        ],
      ),
      body: _isGridView
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: _items.length,
              itemBuilder: (context, i) => Card(child: Center(child: Text(_items[i]))),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, i) => ListTile(title: Text(_items[i])),
            ),
    );
  }
}
