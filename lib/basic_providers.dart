import 'package:flutter_riverpod/flutter_riverpod.dart';

const String greeting = 'Hello, Riverpod!';

final greetingProvider = Provider<String>((ref) => greeting);

final counterProvider = StateProvider<int>((ref) => 0);