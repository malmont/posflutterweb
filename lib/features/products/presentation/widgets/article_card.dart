import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pos_flutter/design/colours.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';

import '../../../../design/design.dart';

class ArticleCard extends StatelessWidget {
  final Product article;
  final void Function(Product) onTap; // Function to handle tap

  const ArticleCard({
    super.key,
    required this.article,
    required this.onTap, // Add the function to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (article != null) {
          onTap(article); // Use the passed function to navigate
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 200,
            width: 250,
            child: Card(
              color: Colours.primaryPalette,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(Units.edgeInsetsLarge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      article.name.length > 13
                          ? '${article.name.substring(0, 13)}...'
                          : article.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: Units.edgeInsetsLarge),
                    Text(
                      '\$${(article.price / 100).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: article.image,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: Units.edgeInsetsXXXXXXXXXXLarge,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.white,
                  child: CircleAvatar(
                    radius: Units.edgeInsetsXXXXXXXXLarge,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                errorWidget: (context, url, error) => const CircleAvatar(
                  radius: Units.edgeInsetsXXXXXXXXLarge,
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
