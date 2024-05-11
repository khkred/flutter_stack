import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stack/providers/counter_notifier.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.watch(counterChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter'),),
      body: Center(
        child: Text('Count: ${counterNotifier.count}', style: const TextStyle(fontSize: 25),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterNotifier.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}
