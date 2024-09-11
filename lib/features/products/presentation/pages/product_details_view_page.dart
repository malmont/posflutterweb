import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pos_flutter/features/products/application/blocs/product_bloc.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/domain/entities/product/variant.dart';
import 'package:pos_flutter/features/products/presentation/widgets/carousel_indicator.dart';
import 'package:pos_flutter/features/products/presentation/widgets/product_details_bottom_bar.dart';
import 'package:pos_flutter/features/products/presentation/widgets/product_image_carousel.dart';
import 'package:pos_flutter/features/products/presentation/widgets/variant_info.dart';
import 'package:pos_flutter/features/products/presentation/widgets/variant_selector.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../design/design.dart';

class ProductDetailsViewPage extends StatefulWidget {
  final Product product;

  const ProductDetailsViewPage({super.key, required this.product});

  @override
  State<ProductDetailsViewPage> createState() => _ProductDetailsViewPageState();
}

class _ProductDetailsViewPageState extends State<ProductDetailsViewPage> {
  int _currentIndex = 0;
  String? selectedColor;
  String? selectedSize;
  Variant? selectedVariant; // Declare selectedVariant here
  late ProductBloc productBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    productBloc = BlocProvider.of<ProductBloc>(context);
  }

  @override
  void dispose() {
    productBloc.add(const ResetVariantEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uniqueColors = widget.product.variants
        .map((variant) => variant.color.codeHexa)
        .toSet()
        .toList();
    final uniqueSizes = widget.product.variants
        .map((variant) => variant.size.name)
        .toSet()
        .toList();

    return Scaffold(
      backgroundColor: Colours.primary100,
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductError) {
            EasyLoading.showSuccess("Variant non trouvé");
            Future.delayed(const Duration(seconds: 2), () {
              EasyLoading.dismiss();
              Navigator.pop(context);
            });
          }

          if (state is ProductLoaded) {
            selectedVariant =
                state.selectedVariant; // Assign selectedVariant here

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageCarousel(
                    product: widget.product,
                    currentIndex: _currentIndex,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  Center(
                    child: CarouselIndicator(
                      currentIndex: _currentIndex,
                      itemCount: 2,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: TextStyles.interMediumH5.copyWith(
                      color: Colours.colorsButtonMenu,
                    ),
                  ),
                  Text(
                    '\$${(widget.product.price / 100).toStringAsFixed(2)}',
                    style: TextStyles.interMediumH5.copyWith(
                      color: Colours.colorsButtonMenu,
                    ),
                  ),
                  VariantSelector(
                    uniqueColors: uniqueColors,
                    uniqueSizes: uniqueSizes,
                    product: widget.product,
                    productBloc: productBloc,
                    selectedColor: selectedColor,
                    selectedSize: selectedSize,
                  ),
                  if (selectedVariant != null)
                    VariantInfo(selectedVariant: selectedVariant!)
                  else
                    const Text('Aucun variant sélectionné'),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          Variant? selectedVariant =
              state is ProductLoaded ? state.selectedVariant : null;
          bool isSelected = true;

          return ProductDetailsBottomBar(
            product: widget.product,
            selectedVariant: selectedVariant, // Passe selectedVariant ici
            onPressed: selectedVariant != null
                ? () {
                    // Ajout au panier ou autre action
                  }
                : null,
          );
        },
      ),
    );
  }
}
