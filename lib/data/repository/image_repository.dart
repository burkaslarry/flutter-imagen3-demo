import '../remote/genkit_client.dart';

abstract class ImageRepository {
  Future<String> generateImage({required String imageDescription});
}

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl({required this.genkitClient});
  final GenkitClient genkitClient;

  @override
  Future<String> generateImage({required String imageDescription}) {
    return genkitClient.generateImage(imageDescription: imageDescription);
  }
}
