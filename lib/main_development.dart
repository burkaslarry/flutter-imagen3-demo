import 'package:flutter/material.dart';
import 'package:flutter_imagen3/config/app_config.dart';
import 'package:flutter_imagen3/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(
          AppConfig(
            flavor: Flavor.development,
            genkitEndpoint: 'https://127.0.0.1:3000',
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
