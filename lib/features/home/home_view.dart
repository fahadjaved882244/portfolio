import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/app_strings.dart';
import 'package:portfolio/features/home/widgets/skills_table.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Profile Image
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  'assets/profile.jpeg',
                ), // Replace with your profile image path
              ),
              const SizedBox(height: 24),

              // Name
              Text(
                AppStrings.myName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),

              // Expertise
              Text(
                AppStrings.myTags,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Introduction
              Text(
                AppStrings.mySummary,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "flutter_logo.png",
                  "firebase_logo.png",
                  "azure_logo.png",
                  "python_logo.png"
                ]
                    .map((logo) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset(
                            'assets/skills/$logo',
                            width: 48,
                            height: 48,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 32),

              const SkillsTable(),
            ],
          ),
        ),
      ),
    );
  }
}
