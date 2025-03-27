import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get in Touch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Feel free to reach out to me via the following methods:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text(
                  'your.email@example.com'), // Replace with your email
              onTap: () {
                // Handle email tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle:
                  const Text('+1234567890'), // Replace with your phone number
              onTap: () {
                // Handle phone tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('LinkedIn'),
              subtitle: const Text(
                  'linkedin.com/in/yourprofile'), // Replace with your LinkedIn profile
              onTap: () {
                // Handle LinkedIn tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Website'),
              subtitle: const Text(
                  'www.yourwebsite.com'), // Replace with your website
              onTap: () {
                // Handle website tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
