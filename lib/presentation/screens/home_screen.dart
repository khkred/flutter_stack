import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stack/presentation/screens/counter_stream_screen.dart';
import 'package:flutter_stack/presentation/screens/to_do_list_screen.dart';
import 'package:flutter_stack/presentation/screens/users_screen.dart';

import '../../providers/basic_providers.dart';
import 'counter_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Basic Provider
    final greeting = ref.watch(greetingProvider);
    //State Provider
    final int count = ref.watch(counterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greeting),
              const SizedBox(height: 20),
              Text(
                'Count: $count',
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoListScreen()));
                  },
                  child: const Text('Go to Todo List')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CounterScreen()));
                  },
                  child: const Text('Go to Counter Screen')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UsersScreen()));
                  },
                  child: const Text('Go to Users Screen')),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CounterStreamScreen()));
              }, child: const Text('Go to Counter Stream Screen')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: const Icon(Icons.add),
        ));
  }
}
