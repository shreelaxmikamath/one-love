import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Create a ValueNotifier to hold the current theme
  static final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(pastelPinkTheme);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable: themeNotifier,
      builder: (context, ThemeData theme, _) {
        return MaterialApp(
          title: 'One-Love',
          theme: theme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
