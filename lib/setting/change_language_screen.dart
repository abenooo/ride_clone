import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String selectedLanguage = 'English'; // Default selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Language',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Language options list
            Expanded(
              child: ListView(
                children: [
                  _buildLanguageOption('English',
                      'asset/language/English.png'), 
                  const SizedBox(height: 16),
                  _buildLanguageOption('Amharic',
                      'asset/language/Amharic.png'), 
                  const SizedBox(height: 16),
                  _buildLanguageOption('Oromo',
                      'asset/language/Oromo.png'),
                  const SizedBox(height: 16),
                  _buildLanguageOption('Somalia',
                      'asset/language/Somalia.png'),
                  const SizedBox(height: 16),
                  _buildLanguageOption('Afar',
                      'asset/language/Afar.png'),
                  const SizedBox(height: 16),
                  _buildLanguageOption('Tigrinya',
                      'asset/language/Tigrinya.png'),
                  const SizedBox(height: 16),
                  _buildLanguageOption('France',
                      'asset/language/France.png'),
                  const SizedBox(height: 16),
                  _buildLanguageOption('Dutch',
                      'asset/language/Dutch.png'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Updated Save button using LoginButton
            LoginButton(
              text: 'Save',
              onPressed: () {
                // Handle language save action
              },
              isOutlined: false, // Change this to true if you want an outlined button
            ),
          ],
        ),
      ),
    );
  }

  // Widget for language options
  Widget _buildLanguageOption(String language, String flagPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectedLanguage == language ? Colors.green : Colors.grey,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Image.asset(flagPath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                language,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Icon(
              selectedLanguage == language
                  ? Icons.check_circle
                  : Icons.circle_outlined,
              color: selectedLanguage == language ? Colors.green : Colors.grey,
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
