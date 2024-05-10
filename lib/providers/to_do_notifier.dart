import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoNotifier extends StateNotifier<List<String>> {
  //We are initializing the state with an empty list
  TodoNotifier() : super([]);

  //This method will add a new todo to the list
  void addTodo(String todo) {
    state = [...state, todo];
  }

//This method will remove a todo from the list
  void removeTodo(String todo) {
    state = state.where((item) => item != todo).toList();
  }
}

final todoCounterProvider = StateProvider<int>((ref) => 0);

final todoProvider =
StateNotifierProvider<TodoNotifier, List<String>>((ref) => TodoNotifier());
