import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pos_flutter/design/colours.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';

class ArticleCard extends StatelessWidget {
  final Product article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 200,
          width: 250,
          child: Card(
            color: Colours.primaryPalette,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  const SizedBox(height: 8),
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
                radius: 80,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 60,
                child: Icon(Icons.error),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
