import 'package:flutter/material.dart';
import 'package:project_1/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<CounterProvider>().count.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().incrementCounter();
                },
                child: const Text('Increment'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().decrementCounter();
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
