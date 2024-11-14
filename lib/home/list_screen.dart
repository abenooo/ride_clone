import 'package:flutter/material.dart';
import 'base_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});  // Updated to use super.key for consistency

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      body:  Center(child: Text('List Screen')),  // Added const back
      currentIndex: 1,  // List/Chat is the second tab
    );
  }
}