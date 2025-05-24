import 'package:flutter/material.dart';
import 'package:portfolio/core/app_strings.dart';
import 'package:portfolio/features/contact/widgets/contact_form.dart';
import 'package:portfolio/features/contact/widgets/contact_social_list.dart';
import 'package:portfolio/features/responsive/utils/media_query_extension.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
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
          !context.isPhone
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contact Social List
                    Expanded(
                      child: ContactSocialList(),
                    ),
                    SizedBox(width: 24),
                    // Contact Form
                    Expanded(
                      child: ContactForm(),
                    ),
                  ],
                )
              : const Column(
                  children: [
                    ContactSocialList(),
                    SizedBox(height: 24),
                    ContactForm(),
                  ],
                ),
        ],
      )),
    );
  }
}
