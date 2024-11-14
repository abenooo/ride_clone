import 'package:flutter/material.dart';
import 'base_screen.dart';

class HomeWorkScreen extends StatelessWidget {
  const HomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      body:  Center(child: Text('Home Work Screen')),
      currentIndex: 2,  // HomeWork is the third tab
    );
  }
}