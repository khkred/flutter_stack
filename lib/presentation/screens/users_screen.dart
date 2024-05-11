import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/users_provider.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: usersAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]['name']),
              subtitle: Text(users[index]['email']),
            );
          },
        )
      ),
    );
  }
}