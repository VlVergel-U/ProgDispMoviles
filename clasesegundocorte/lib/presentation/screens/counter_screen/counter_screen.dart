import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clasesegundocorte/presentation/providers/counter_provider.dart';
import 'package:clasesegundocorte/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final bool theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).update(
                      (state) => !state,
                    );
              },
              icon: Icon(theme ? Icons.dark_mode : Icons.light_mode))
        ],
      ),
      body: Center(
        child: Text('valor $counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.abc_outlined),
      ),
    );
  }
}
