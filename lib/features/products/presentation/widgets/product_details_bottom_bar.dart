import 'package:flutter/material.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/domain/entities/product/variant.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final Product product;
  final Variant? selectedVariant;
  final VoidCallback? onPressed; // Nouveau paramètre pour la gestion du bouton

  const ProductDetailsBottomBar({
    super.key,
    required this.product,
    required this.selectedVariant,
    this.onPressed, // Récupère l'action à effectuer sur le bouton
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 80 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 10,
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                '\$${(product.price / 100).toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: onPressed, // Utilise le onPressed reçu en paramètre
              child: const Text('Ajouter au panier'),
            ),
          ),
        ],
      ),
    );
  }
}
