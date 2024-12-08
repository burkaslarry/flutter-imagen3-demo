import 'package:flutter/material.dart';
import 'package:flutter_imagen3/ui/components/generated_image_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../usecase/generate_image_usecase.dart';

final generatedImageUrlProvider = StateProvider<String?>((ref) => null);

class ImageGeneratorPage extends ConsumerWidget {
  ImageGeneratorPage({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(generatedImageUrlProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagen 3 Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Image Description',
                hintText: 'Enter what you want to generate',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                {
                  // Call the image generation usecase with the text input
                  // and update the generated image URL in the state
                  final generatedImageUrl = await ref
                      .read(generateImageUsecaseProvider)
                      .invoke(imageDescription: _controller.text);
                  ref.read(generatedImageUrlProvider.notifier).state =
                      generatedImageUrl;
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Generate Image'),
            ),
            const SizedBox(height: 16),
            if (imageUrl != null)
              Expanded(
                child: GeneratedImageView(imageUrl: imageUrl),
              ),
          ],
        ),
      ),
    );
  }
}
