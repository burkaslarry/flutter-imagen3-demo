import 'package:dio/dio.dart';
import 'package:flutter_imagen3/config/app_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider that holds a [Dio] instance
final dioProvider = Provider<Dio>(
  (_) => Dio(),
);

/// Provider for [GenkitClient] instance
final genkitClientProvider = Provider<GenkitClient>(
  (ref) => GenkitClient(
    dio: ref.read(dioProvider),
    appConfig: ref.read(appConfigProvider),
  ),
);

/// Client for generating images using Imagen 3 via Genkit
class GenkitClient {
  GenkitClient({
    required this.dio,
    required this.appConfig,
  });
  final Dio dio;
  final AppConfig appConfig;

  /// Generates an image based on the provided description and returns Base64 encoded image data
  ///
  /// [description] Description of the image to generate
  /// Returns: Base64 encoded image data in the format of 'data:image/png;base64,...'
  Future<String> generateImage({required String imageDescription}) async {
    try {
      final response = await dio.post(
        '${appConfig.genkitEndpoint}/generateImage',
        data: {
          'data': {
            'imageDescription': imageDescription,
          },
        },
      );

      if (response.statusCode == 200) {
        return response.data['result']['url'] as String;
      }
      throw Exception('Failed to generate image: ${response.statusCode}');
    } on DioException catch (e) {
      throw Exception('Failed to generate image: ${e.message}');
    }
  }
}
