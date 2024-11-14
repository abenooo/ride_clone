import 'package:flutter/material.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Back",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 14),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Verification email or phone number",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
