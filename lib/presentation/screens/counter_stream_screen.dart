import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/basic_providers.dart';

class CounterStreamScreen extends ConsumerWidget {
  const CounterStreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterAsyncValue = ref.watch(counterStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Stream'),
      ),
      body: Center(
        child: counterAsyncValue.when(
          data: (count) => Text('Current Count: $count', style: const TextStyle(fontSize: 24)),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}