import 'package:flutter/material.dart';
import 'package:emat_project_7/view/crypto_screen.dart';
import 'theme/theme_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeNotifier themeNotifier = ThemeNotifier();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          title: 'Crypto Price Tracker',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: CryptoScreen(
            onThemeChanged: themeNotifier.toggleTheme,
          ),
        );
      },
    );
  }
}
