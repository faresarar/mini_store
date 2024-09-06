import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../widgets/custom_icon.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: CustomIcon(
            function: () {},
            icon: IconlyBold.category,
          ),
          actions: [
            CustomIcon(
              function: () {},
              icon: IconlyBold.user3,
            )
          ],
        ),
        body: const Center(
          child: Text("Welcome to this course"),
        ),
      ),
    );
  }
}
