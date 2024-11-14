import '/auth/forgot_password_screen.dart';
import '/auth/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen> {
  bool _isPasswordHidden = true; // Default value

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
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            const Text("Sign in with your email or phone number",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email or Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: _isPasswordHidden,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 30.0,),
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
                          builder: (context) =>  HomeScreen()));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                      'Sign In with Gmail'), // Added 'const' for performance
                  style: OutlinedButton.styleFrom(
                    padding:const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 0), // Full width
                  ),
                  onPressed: () {
                    // Handle Gmail sign up
                  },
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.facebook),
                  label: const Text('Sign In with Facebook'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 0), // Full width
                  ),
                  onPressed: () {
                    // Handle Facebook sign up
                  },
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.apple),
                  label: const Text('Sign In with Apple'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 0), // Full width
                  ),
                  onPressed: () {
                    // Handle Apple sign up
                  },
                ),
                const SizedBox(height: 20),
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
                          TextSpan(text: 'Don’t have an account?  Sign Up'),
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ])),
    );
  }
}
