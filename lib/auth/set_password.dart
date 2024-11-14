import 'package:flutter/material.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Back',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, size: 14),
        ),
        centerTitle: false,
      ),
      body: const Center(
          child: Column(
        children: [
          SizedBox(height: 16),
          Text('Set Password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.normal)),
          Text('Set your password',
              style: TextStyle(color: Colors.grey, fontSize: 16)),

          // SizedBox(height: 16),
        ],
      )),
    );
  }
}
