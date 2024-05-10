import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/to_do_notifier.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> todos = ref.watch(todoProvider);
    final todoCounter = ref.watch(todoCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView(
        children: todos
            .map((todo) => ListTile(
          title: Text(todo),
        ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todoCounterProvider.notifier).state++;
          ref.read(todoProvider.notifier).addTodo('Todo $todoCounter');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
