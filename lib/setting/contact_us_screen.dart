import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
      ),
      body: Padding(
        // Removed 'const' here
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Contact us for Ride share',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
                'House# 72, Road# 21, Banani, Dhaka-1213 (near Banani Bidyaniketon School & College, beside University of South Asia)'),
            SizedBox(height: 10),
            Text('Call : 13301 (24/7)'),
            Text('Email : support@pathao.com'),
            SizedBox(height: 16),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Your Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Your Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Updated Save button to display in full width
            SizedBox(
              width: double.maxFinite, // Make the button full width
              child: LoginButton(
                text: 'Save',
                onPressed: () {
                  // Handle language save action
                },
                isOutlined: false, // Change this to true if you want an outlined button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Reusable LoginButton widget (from previous code)
class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // margin: const EdgeInsets.only(bottom: 16),
        backgroundColor: isOutlined ? Colors.white : const Color(0xFF008955),
        padding: const EdgeInsets.only(bottom: 16,top: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isOutlined
              ? const BorderSide(color: Color(0xFF008955), width: 2)
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
