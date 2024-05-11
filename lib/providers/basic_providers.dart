import 'package:flutter_riverpod/flutter_riverpod.dart';

const String greeting = 'Hello, Riverpod!';

final greetingProvider = Provider<String>((ref) => greeting);

final counterProvider = StateProvider<int>((ref) => 0);

final counterStreamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (count) =>  count +1);
});