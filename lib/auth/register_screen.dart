import 'package:alepha_digital_tracking/auth/login_screen.dart';

import '/auth/otp_screen.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF008955); // Define your primary color here

class RegisterScreen extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<RegisterScreen> {
  bool _agreeToTerms = false;

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Sign up with your email or phone number',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    counterText: '', // Hides the character counter
                    labelText: 'Phone Number',
                    prefix: const Text(
                      '+251 ', // Initial country code as prefix
                      style: TextStyle(
                          color: Colors.black), // Style for the prefix
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  // Add any necessary validation or controller here
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreeToTerms = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'By signing up, you agree to the '),
                            TextSpan(
                              text: 'Terms of service',
                              style: TextStyle(color: Colors.green),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy policy',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF008955),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtpScreen()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon:
                      const Icon(Icons.email), // Added 'const' for performance
                  label: const Text(
                      'Sign up with Gmail'), // Added 'const' for performance
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Handle Gmail sign up
                  },
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.facebook),
                  label: const Text('Sign up with Facebook'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Handle Facebook sign up
                  },
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.apple),
                  label: const Text('Sign up with Apple'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Handle Apple sign up
                  },
                ),
                const SizedBox(height: 12),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginScreen()),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Already have an account? '),
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
