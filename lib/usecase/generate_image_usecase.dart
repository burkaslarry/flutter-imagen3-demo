import 'package:flutter_imagen3/data/repository/image_repository_provider.dart';
import 'package:flutter_imagen3/ui/components/overlay_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/image_repository.dart';

/// Provider for creating an instance of [GenerateImageUsecase]
///
/// Used to inject the usecase into the UI layer
final generateImageUsecaseProvider = Provider<GenerateImageUsecase>(
  (ref) => GenerateImageUsecase(
    imageRepository: ref.read(imageRepositoryProvider),
  ),
);

/// [GenerateImageUsecase] is directly called from the UI layer and encapsulates the API request for image generation
class GenerateImageUsecase {
  final ImageRepository imageRepository;

  /// Constructs a [GenerateImageUsecase] with the given [Ref]
  ///
  /// The [Ref] is used to read necessary providers
  GenerateImageUsecase({required this.imageRepository});

  /// Executes the image generation usecase
  Future<String> invoke({
    required String imageDescription,
    required WidgetRef ref,
  }) async {
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      return await imageRepository.generateImage(
          imageDescription: imageDescription);
    } catch (e) {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }
}
