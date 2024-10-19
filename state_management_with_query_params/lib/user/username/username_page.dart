import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UsernamePage extends StatelessWidget {
  static const String routePath = '/username';
  static const String routeName = 'username';

  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Username',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Username Page'),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
