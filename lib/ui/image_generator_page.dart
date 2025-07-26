import 'package:flutter/material.dart';
import 'package:flutter_imagen3/ui/components/generated_image_view.dart';
import 'package:flutter_imagen3/ui/image_generator_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageGeneratorPage extends ConsumerWidget {
  ImageGeneratorPage({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(imageGeneratorNotifierProvider).state;
    final notifier = ref.read(imageGeneratorNotifierProvider.notifier);

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
              onPressed: () {
                notifier.generateImage(
                  imageDescription: _controller.text,
                  ref: ref,
                );
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
            if (state.error != null)
              Text(
                state.error!,
                style: const TextStyle(color: Colors.red),
              ),
            if (state.imageUrl != null)
              Expanded(
                child: GeneratedImageView(imageUrl: state.imageUrl!),
              ),
          ],
        ),
      ),
    );
  }
}
