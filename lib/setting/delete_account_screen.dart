import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Account'),
      ),  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Delete Account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            SizedBox(height: 16),
            Text('Are you sure you want to delete your account? Please read how account deletion will affect.Deleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
