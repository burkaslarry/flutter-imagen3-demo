import 'package:flutter/foundation.dart';

@immutable
class ImageGeneratorState {
  const ImageGeneratorState({
    this.imageUrl,
    this.isLoading = false,
    this.error,
  });

  final String? imageUrl;
  final bool isLoading;
  final String? error;

  ImageGeneratorState copyWith({
    String? imageUrl,
    bool? isLoading,
    String? error,
  }) {
    return ImageGeneratorState(
      imageUrl: imageUrl ?? this.imageUrl,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
