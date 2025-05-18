import 'package:flutter/material.dart';
import 'package:portfolio/core/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            // Name
            Text(
              AppStrings.contactTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),

            // Expertise
            Text(
              AppStrings.contactTags,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            ListTile(
              leading: Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  'assets/linkedin.png',
                  width: 24,
                  height: 24,
                ),
              ),
              title: const Text('LinkedIn'),
              subtitle: const Text(
                  'linkedin.com/in/fahadjaved882244'), // Replace with your LinkedIn profile
              onTap: () {
                // Handle LinkedIn tap
                launchUrl(
                  Uri.parse('https://www.linkedin.com/in/fahadjaved882244/'),
                );
              },
            ),

            ListTile(
              leading: Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  'assets/github.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text('GitHub'),
              subtitle: const Text(
                  'github.com/fahadjaved882244'), // Replace with your LinkedIn profile
              onTap: () {
                // Handle GitHub tap
                launchUrl(
                  Uri.parse('https://www.github.com/fahadjaved882244/'),
                );
              },
            ),

            ListTile(
              leading: Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
                child: Icon(
                  Icons.phone,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              title: const Text('Phone'),
              subtitle: const Text('+447774079076'),
              onTap: () {
                // Handle phone tap
                launchUrl(
                  Uri.parse('tel:+447774079076'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
