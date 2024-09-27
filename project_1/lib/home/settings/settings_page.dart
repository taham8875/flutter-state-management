import 'package:flutter/material.dart';
import 'package:project_1/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Username: ${context.watch<UserProvider>().username}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Enter new username',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context
                  .read<UserProvider>()
                  .setUsername(_usernameController.text);
              FocusManager.instance.primaryFocus?.unfocus();
              _usernameController.clear();
            },
            child: const Text('Update Username'),
          ),
        ],
      ),
    );
  }
}
