import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteColorPage extends StatelessWidget {
  static const String routePath = '/favorite_color';
  static const String routeName = 'favorite_color';

  const FavoriteColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Color',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Favorite Color Page'),
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
