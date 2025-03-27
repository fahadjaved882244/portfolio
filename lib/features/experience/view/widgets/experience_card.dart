import 'package:flutter/material.dart';
import 'package:portfolio/features/experience/model/experience.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(content: Text("Requested URL not found!"));

    return ListTile(
      onTap: () async {
        try {
          final uri = Uri.parse(experience.companyWebsite);
          if (await canLaunchUrl(uri)) {
            launchUrl(uri);
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      isThreeLine: true,
      title: Text(
        experience.jobTitle,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Text(
          "${experience.companyName}\n${experience.companyLocation}\n${experience.startDate} - ${experience.endDate}"),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 48,
          height: 48,
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Image.asset(experience.companyLogo),
        ),
      ),
    );
  }
}
