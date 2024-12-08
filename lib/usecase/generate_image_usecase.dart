import 'package:flutter_imagen3/data/genkit_client.dart';
import 'package:flutter_imagen3/ui/components/overlay_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for creating an instance of [GenerateImageUsecase]
///
/// Used to inject the usecase into the UI layer
final generateImageUsecaseProvider = Provider<GenerateImageUsecase>(
  GenerateImageUsecase.new,
);

/// [GenerateImageUsecase] is directly called from the UI layer and encapsulates the API request for image generation
class GenerateImageUsecase {
  final Ref ref;

  /// Constructs a [GenerateImageUsecase] with the given [Ref]
  ///
  /// The [Ref] is used to read necessary providers
  GenerateImageUsecase(this.ref);

  /// Executes the image generation usecase
  Future<String> invoke({
    required String imageDescription,
  }) async {
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      return await ref
          .read(genkitClientProvider)
          .generateImage(imageDescription: imageDescription);
    } catch (e) {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }
}
