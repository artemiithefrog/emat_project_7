import 'package:emat_project_7/view/crypto_list.dart';
import 'package:flutter/material.dart';

class CryptoScreen extends StatelessWidget {
  final VoidCallback onThemeChanged;

  const CryptoScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Price Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onThemeChanged,
          ),
        ],
      ),
      body: const CryptoList(),
    );
  }
}
