import 'package:flutter/material.dart';

class Moderate7Screen extends StatefulWidget {
  const Moderate7Screen({super.key});

  @override
  State<Moderate7Screen> createState() => _Moderate7ScreenState();
}

class _Moderate7ScreenState extends State<Moderate7Screen> {
  final List<String> _todos = [];
  final _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 7: To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(hintText: 'Add a task'))),
                IconButton(icon: const Icon(Icons.add), onPressed: _addTodo),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_todos[index]),
                trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => _deleteTodo(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
