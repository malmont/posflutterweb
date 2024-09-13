import 'package:flutter/material.dart';

import '../../../../design/design.dart';

class OutlineLabelCard extends StatelessWidget {
  final String title;
  final Widget child;
  const OutlineLabelCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelStyle:
            TextStyles.interMediumH6.copyWith(color: Colours.colorsButtonMenu),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: Units.edgeInsetsLarge),
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Units.radiusXXXXLarge),
        ),
      ),
      child: child,
    );
  }
}
