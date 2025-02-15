import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/local_db/local_db.dart';
import 'package:portfolio/features/responsive/controller.dart/responsive_controller.dart';
import 'package:portfolio/features/responsive/view/responsive_view.dart';
import 'package:portfolio/features/themes/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeControllerProvider);
    ref.watch(responsiveIndexProvider);

    final brightness = ref.read(themeControllerProvider.notifier).brightness;
    final seedColor = ref.read(responsiveIndexProvider.notifier).themeSeedColor;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: brightness,
        colorScheme: ColorScheme.fromSeed(
          brightness: brightness,
          seedColor: seedColor,
        ),
        useMaterial3: true,
      ),
      home: const ResponsiveView(),
    );
  }
}
