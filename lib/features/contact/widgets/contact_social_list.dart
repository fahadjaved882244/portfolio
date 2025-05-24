import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSocialList extends StatelessWidget {
  const ContactSocialList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          subtitle: const Text('linkedin.com/in/fahadjaved882244'),
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
            'github.com/fahadjaved882244',
          ),
          onTap: () {
            // Handle GitHub tap
            launchUrl(
              Uri.parse('https://www.github.com/fahadjaved882244/'),
            );
          },
        ),
      ],
    );
  }
}
