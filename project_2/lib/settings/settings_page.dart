import 'package:flutter/material.dart';
import 'package:project_2/user/user_inherited_widget.dart';

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
          Text(
            'Username: ${UserInheritedWidget.of(context)?.username ?? 'Unknown'}',
            style: const TextStyle(
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
              UserInheritedWidget.of(context)
                  ?.setUsername(usernameController.text);
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
