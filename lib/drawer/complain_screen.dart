import  'package:flutter/material.dart';
class ComplainScreen extends StatelessWidget {
  const ComplainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Complain"),
        centerTitle: false,
        backgroundColor: Colors.green,
        elevation: 0,
      ),

    );
  }
}