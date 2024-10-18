import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Username: unknown',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Enter new username',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              debugPrint('Update username');
              FocusManager.instance.primaryFocus?.unfocus();
              usernameController.clear();
            },
            child: const Text('Update Username'),
          ),
        ],
      ),
    );
  }
}
