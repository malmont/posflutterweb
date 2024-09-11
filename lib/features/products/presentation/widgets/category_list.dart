import 'package:flutter/material.dart';
import 'package:pos_flutter/features/products/domain/entities/categoty/category.dart';

import '../../../../design/design.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final int selectedCategoryId;
  final Function(int) onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          bool isSelected = category.id == selectedCategoryId;
          return GestureDetector(
            onTap: () => onCategorySelected(category.id),
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Units.edgeInsetsXLarge,
                  vertical: Units.edgeInsetsXLarge),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Units.radiusXXLarge),
                color:
                    isSelected ? Colours.colorsButtonMenu : Colours.primary100,
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                category.name,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
