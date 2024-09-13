import 'package:flutter/material.dart';
import '../../../../design/design.dart';

class GenericList<T> extends StatelessWidget {
  final List<T> items;
  final int selectedIndex;
  final Function(int) onItemSelected;
  final Widget Function(T, bool) itemBuilder;

  const GenericList({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          T item = entry.value;
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: itemBuilder(item, isSelected),
          );
        }).toList(),
      ),
    );
  }
}
