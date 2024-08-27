import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const String name = 'counter-screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Valor: 10',
          style: Theme.of(context).textTheme.titleLarge
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}