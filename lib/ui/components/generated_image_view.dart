import 'package:flutter/material.dart';

class GeneratedImageView extends StatelessWidget {
  const GeneratedImageView({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.memory(
          Uri.parse(imageUrl).data!.contentAsBytes(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
