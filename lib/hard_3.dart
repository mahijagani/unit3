import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String id;
  final String description;
  final bool completed;
  Todo({required this.id, required this.description, this.completed = false});

  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void add(String description) {
    state = [...state, Todo(id: DateTime.now().toString(), description: description)];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class Hard3Screen extends ConsumerWidget {
  const Hard3Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Hard 3: Riverpod Todo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Add Todo'),
              onSubmitted: (value) {
                ref.read(todoListProvider.notifier).add(value);
                controller.clear();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.description, style: TextStyle(decoration: todo.completed ? TextDecoration.lineThrough : null)),
                  leading: Checkbox(value: todo.completed, onChanged: (_) => ref.read(todoListProvider.notifier).toggle(todo.id)),
                  trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => ref.read(todoListProvider.notifier).remove(todo.id)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
