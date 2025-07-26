import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Flavor {
  development,
  production,
}

class AppConfig {
  AppConfig({
    required this.flavor,
    required this.genkitEndpoint,
  });

  final Flavor flavor;
  final String genkitEndpoint;
}

final appConfigProvider = Provider<AppConfig>((ref) {
  throw UnimplementedError();
});
