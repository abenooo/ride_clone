import 'package:alepha_digital_tracking/setting/change_language_screen.dart';
import 'package:alepha_digital_tracking/setting/contact_us_screen.dart';
import 'package:alepha_digital_tracking/setting/delete_account_screen.dart';
import 'package:alepha_digital_tracking/setting/privacy_policy_screen.dart';

import '/home/base_screen.dart';
import 'package:flutter/material.dart';
import '../setting/change_password_screen.dart'; // Import the ChangePasswordScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildSettingsOption(context, 'Change Password', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen(),
                    ),
                  );
                }),
                _buildSettingsOption(context, 'Change Language', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangeLanguageScreen(),
                    ),
                  );
                }),
                _buildSettingsOption(context, 'Privacy Policy', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                }),
                _buildSettingsOption(context, 'Contact Us', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUsScreen(),
                    ),
                  );
                }),
                _buildSettingsOption(context, 'Delete Account', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeleteAccountScreen(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      currentIndex: 4,
    );
  }

  // Method to create each settings option with consistent style
  Widget _buildSettingsOption(BuildContext context, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.black),
        onTap: onTap,
      ),
    );
  }
}
