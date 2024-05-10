import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../basic_providers.dart';

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
            children: [
              Text(greeting),
              const SizedBox(height: 20),
              Text(
                'Count: $count',
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: const Icon(Icons.add),
        )
    );
  }

}
