import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter-screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch -> que este pendiente de nuestro counterProvider
    // No usarlo en metodos
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined 
            ),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // de esta forma podemos hacer uso de la lectura
          ref.read(counterProvider.notifier).state++;

          // Esta es otra forma de poder hacerlo
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}