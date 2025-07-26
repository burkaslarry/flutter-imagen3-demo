import 'package:flutter/material.dart';
import 'package:flutter_imagen3/ui/image_generator_state.dart';
import 'package:flutter_imagen3/usecase/generate_image_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageGeneratorNotifierProvider =
    ChangeNotifierProvider.autoDispose<ImageGeneratorNotifier>(
  (ref) => ImageGeneratorNotifier(
    generateImageUsecase: ref.read(generateImageUsecaseProvider),
  ),
);

class ImageGeneratorNotifier extends ChangeNotifier {
  ImageGeneratorNotifier({required this.generateImageUsecase});

  final GenerateImageUsecase generateImageUsecase;
  ImageGeneratorState _state = const ImageGeneratorState();
  ImageGeneratorState get state => _state;

  Future<void> generateImage({
    required String imageDescription,
    required WidgetRef ref,
  }) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final imageUrl = await generateImageUsecase.invoke(
        imageDescription: imageDescription,
        ref: ref,
      );
      _state = _state.copyWith(
        imageUrl: imageUrl,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      _state = _state.copyWith(
        error: e.toString(),
        isLoading: false,
        imageUrl: null,
      );
    } finally {
      notifyListeners();
    }
  }
}
