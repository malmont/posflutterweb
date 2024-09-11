import 'package:flutter/material.dart';

import '../../../../design/design.dart';

class ColorSelector extends StatelessWidget {
  final List<String> uniqueColors;
  final String? selectedSize;
  final String? selectedColor;
  final Function(String) onColorSelected;

  const ColorSelector({
    super.key,
    required this.uniqueColors,
    required this.selectedSize,
    required this.selectedColor,
    required this.onColorSelected,
  });

  Color getColorFromHex(String colorString) {
    return Color(
      int.parse(colorString.replaceFirst('#', ''), radix: 16) + 0xFF000000,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: uniqueColors.map((color) {
        return GestureDetector(
          onTap: () {
            onColorSelected(color);
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColorFromHex(color),
              border: selectedColor == color
                  ? Border.all(color: Colours.colorsButtonMenu, width: 2)
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}
