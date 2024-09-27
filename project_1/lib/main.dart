import 'package:flutter/material.dart';
import 'package:project_1/home/home_page.dart';
import 'package:project_1/providers/counter_provider.dart';
import 'package:project_1/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
