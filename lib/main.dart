import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MiniStore());
}

class MiniStore extends StatelessWidget {
  const MiniStore({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
