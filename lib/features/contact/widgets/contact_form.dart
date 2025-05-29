import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends HookConsumerWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final autovalidateMode = useState(AutovalidateMode.disabled);
    final subjectController = useTextEditingController();
    final bodyController = useTextEditingController();
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: subjectController,
            decoration: const InputDecoration(
              labelText: 'Subject',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.length <= 3) {
                return 'Please enter a subject';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: bodyController,
            decoration: const InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.length <= 3) {
                return 'Please enter a message';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          FilledButton.tonal(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: "fahadjaved882244@gmail.com",
                  queryParameters: {
                    'subject': subjectController.text,
                    'body': bodyController.text,
                  },
                );
                if (await canLaunchUrl(emailLaunchUri)) {
                  await launchUrl(emailLaunchUri);
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Could not launch email client'),
                      ),
                    );
                  }
                }
              } else {
                autovalidateMode.value = AutovalidateMode.always;
              }
            },
            child: const Text('Send me a message'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
