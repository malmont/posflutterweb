import 'package:flutter/material.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/presentation/widgets/article_card.dart';

import '../../../../design/design.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final ScrollController scrollController;

  const ProductGrid({
    super.key,
    required this.products,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Units.edgeInsetsXLarge),
      child: Padding(
        padding: const EdgeInsets.all(Units.edgeInsetsLarge),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: Units.sizedbox_30),
                ArticleCard(article: products[index]),
              ],
            );
          },
        ),
      ),
    );
  }
}
