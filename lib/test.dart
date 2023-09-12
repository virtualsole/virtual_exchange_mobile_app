import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
    MaterialApp(
      home: ProviderScope(
        child: MyApp(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  int num = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(numProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          int num = ref.watch(numProvider);

          return Center(
            child: Text(
              num.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
          );
        },
      ),
    );
  }
}

class AuthNotifier extends StateNotifier<int> {
  AuthNotifier(super.state);

  int num = 0;

  void increment() {
    num++;
  }
}
