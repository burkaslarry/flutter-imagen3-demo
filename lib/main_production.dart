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
            flavor: Flavor.production,
            genkitEndpoint: 'https://<YOUR_PRODUCTION_ENDPOINT>',
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
