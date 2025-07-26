import 'package:flutter_imagen3/data/remote/genkit_client.dart';
import 'package:flutter_imagen3/data/repository/image_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageRepositoryProvider = Provider<ImageRepository>(
  (ref) => ImageRepositoryImpl(
    genkitClient: ref.read(genkitClientProvider),
  ),
);
