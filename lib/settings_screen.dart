import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text(
          'ABOUT US\n Your Guardian is a revolutionary safety app crafted to provide security and peace of mind for everyone,everywhere. Whether you are navigating daily life or facing unexpected situations, Your Guardian ensures  help is always provided.\nThe app offers four versatile activation methods, allowing you to summon assistance in any circumstance effortlessly. In moments of danger, it instantly alerts your selected guardians. If they do not respond within five minutes, the app automatically escalates the alert to notify a police officer, ensuring you are never left unprotected. Setting up Your Guardian is hassle-free—Users only need to register their details once during sign-up, and the app securely stores the information for future use. Additionally, location services only need to be enabled once.\nWith its user-friendly interface and robust functionality, Your Guardian empowers you to feel safe wherever you go. Combining simplicity, reliability, and efficiency, Your Guardian provides proactive protection and peace of mind, empowering you to navigate life confidently, knowing help is always within reach.\n\nCONTACT US\nYour Guardian:Your Safety :- 8590589307,9961966512\nEmailID:yourguardianyoursafety@gmail.com\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
