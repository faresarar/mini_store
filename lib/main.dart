import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_store/manager/theme_manager.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MiniStore());
  });
}

class MiniStore extends StatelessWidget {
  const MiniStore({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.themeData(context: context),
      home: const HomeScreen(),
    );
  }
}
