import 'package:flutter/material.dart';

import '../../../../design/design.dart';

class SizeSelector extends StatelessWidget {
  final List<String> uniqueSizes;
  final String? selectedColor;
  final String? selectedSize;
  final Function(String) onSizeSelected;

  const SizeSelector({
    super.key,
    required this.uniqueSizes,
    required this.selectedColor,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: uniqueSizes.map((size) {
        return GestureDetector(
          onTap: () {
            onSizeSelected(size);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedSize == size
                    ? Colours.colorsButtonMenu
                    : Colours.primaryPalette,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(size.substring(0, 1)),
          ),
        );
      }).toList(),
    );
  }
}
