import 'package:flutter/material.dart';

class Moderate2Screen extends StatefulWidget {
  const Moderate2Screen({super.key});

  @override
  State<Moderate2Screen> createState() => _Moderate2ScreenState();
}

class _Moderate2ScreenState extends State<Moderate2Screen> {
  final List<String> _allNames = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape'];
  List<String> _filteredNames = [];

  @override
  void initState() {
    super.initState();
    _filteredNames = _allNames;
  }

  void _filter(String query) {
    setState(() {
      _filteredNames = _allNames
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 2: Search Filter')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filter,
              decoration: const InputDecoration(labelText: 'Search', border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredNames.length,
              itemBuilder: (context, index) => ListTile(title: Text(_filteredNames[index])),
            ),
          ),
        ],
      ),
    );
  }
}
