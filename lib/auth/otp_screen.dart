import 'package:alepha_digital_tracking/auth/set_password.dart';

import '/auth/register_screen.dart';
import 'package:flutter/material.dart';

// Define your color constant at the top of the file
const Color primaryColor = Color(0xFF008955); // Define  primary color here

void main() {
  runApp(const OtpScreen());
}

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Verification',
      theme: ThemeData(
        primaryColor: primaryColor, // Use the defined constant
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PhoneVerificationScreen(),
    );
  }
}

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  PhoneVerificationScreenState createState() => PhoneVerificationScreenState();
}

class PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final List<String> _otpDigits = ['', '', '', '', ''];
  int _currentIndex = 0;

  void _updateOTP(String digit) {
    if (_currentIndex < 5) {
      setState(() {
        _otpDigits[_currentIndex] = digit;
        _currentIndex++;
      });
    }
  }

  void _removeLastDigit() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _otpDigits[_currentIndex] = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 16),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterScreen())),
        ),
        title: const Text('Back',
            style: TextStyle(color: Colors.black, fontSize: 16)),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Phone verification',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Enter your OTP code',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            _otpDigits[index],
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Didn't receive code? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Resend again',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SetPassword()));
              },
              child: const Text(
                "Verify",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: const Color(0xFFEFEFF0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 2,
              children: [
                ...[1, 2, 3, 4, 5, 6, 7, 8, 9]
                    .map((digit) => _buildKeypadButton(digit.toString())),
                _buildKeypadButton('.'),
                _buildKeypadButton('0'),
                _buildKeypadButton('⌫', isBackspace: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypadButton(String label, {bool isBackspace = false}) {
    return InkWell(
      onTap: () {
        if (isBackspace) {
          _removeLastDigit();
        } else if (label != '.') {
          _updateOTP(label);
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: isBackspace
            ? const Icon(Icons.backspace_outlined)
            : Text(
                label,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
