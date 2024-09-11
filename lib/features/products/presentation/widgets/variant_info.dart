import 'package:flutter/material.dart';
import 'package:pos_flutter/features/products/domain/entities/product/variant.dart';

import '../../../../design/design.dart';

class VariantInfo extends StatelessWidget {
  final Variant selectedVariant;

  const VariantInfo({Key? key, required this.selectedVariant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Couleur sélectionnée : ${selectedVariant.color.name}',
          style: TextStyles.interRegularH6.copyWith(
            color: Colours.colorsButtonMenu,
          ),
        ),
        Text(
          'Taille sélectionnée : ${selectedVariant.size.name}',
          style: TextStyles.interRegularH6.copyWith(
            color: Colours.colorsButtonMenu,
          ),
        ),
        Text(
          'Quantité en stock : ${selectedVariant.stockQuantity}',
          style: TextStyles.interRegularH6.copyWith(
            color: Colours.colorsButtonMenu,
          ),
        ),
      ],
    );
  }
}
