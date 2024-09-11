import 'package:flutter/material.dart';

import '../../../../design/design.dart';

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
          const SizedBox(height: Units.sizedbox_20),
          Text(message, style: const TextStyle(fontSize: Units.sizedbox_20)),
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
