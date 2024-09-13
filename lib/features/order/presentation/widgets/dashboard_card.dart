import 'package:flutter/material.dart';

import '../../../../design/design.dart';

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colours.primaryPalette,
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Units.radiusXXXXLarge),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Units.edgeInsetsXXXXXLarge,
            horizontal: Units.edgeInsetsXXXLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(Units.edgeInsetsXLarge),
              child: Icon(
                icon,
                size: 40,
                color: Colours.colorsButtonMenu,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Units.edgeInsetsLarge),
              child: Text('\$$value',
                  style: TextStyles.interRegularBody1
                      .copyWith(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(Units.edgeInsetsLarge),
              child: Text(label,
                  style: TextStyles.interRegularBody1.copyWith(
                    color: Colours.colorsButtonMenu,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
