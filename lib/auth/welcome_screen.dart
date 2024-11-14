import '/auth/login_screen.dart';
import '/auth/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      'asset/onboarding/Welcome Screen.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Have a better sharing experience',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 16),
              LoginButton(
                text: 'Create an account',
                onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())
               ,);
                },
                isOutlined: false,
              ),
              const SizedBox(height: 16),
              LoginButton(
                text: 'Login',
                onPressed: () {
                  // TODO: Implement login
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                isOutlined: true,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : const Color(0xFF008955),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // Add border color for outlined button
          side: isOutlined 
              ? const BorderSide(color:  Color(0xFF008955), width: 2) 
              : BorderSide.none,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: isOutlined ? const Color(0xFF008955) : Colors.white,
        ),
      ),
    );
  }
}
