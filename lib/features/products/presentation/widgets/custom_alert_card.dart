import 'package:flutter/material.dart';

class CustomAlertCard extends StatelessWidget {
  final String image;
  final String message;
  final VoidCallback? onClick;

  const CustomAlertCard({
    super.key,
    required this.image,
    required this.message,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 600),
          const SizedBox(height: 20),
          Text(message, style: const TextStyle(fontSize: 18)),
          if (onClick != null)
            IconButton(
              onPressed: onClick,
              icon: const Icon(Icons.refresh),
            ),
        ],
      ),
    );
  }
}
