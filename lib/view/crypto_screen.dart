import 'package:flutter/material.dart';
import 'package:emat_project_7/view/crypto_list.dart';
import 'package:provider/provider.dart';
import 'package:emat_project_7/theme/theme_provider.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Price Tracker'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkTheme
                ? Icons.brightness_7
                : Icons.brightness_2),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: const CryptoList(),
    );
  }
}
