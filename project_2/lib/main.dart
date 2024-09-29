import 'package:flutter/material.dart';
import 'package:project_2/home/home_page.dart';
import 'package:project_2/user/user_inherited_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String username = 'Unknown';

  void setUsername(String newUsername) {
    setState(() {
      username = newUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInheritedWidget(
        username: username,
        setUsername: setUsername,
        child: const HomePage(),
      ),
    );
  }
}
