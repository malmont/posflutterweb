import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pos_flutter/features/products/application/blocs/product_bloc.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/domain/entities/product/variant.dart';
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
  bool isSelected = true;
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

  List<String> getAvailableSizes(String color) {
    return widget.product.variants
        .where((variant) => variant.color.codeHexa == color)
        .map((variant) => variant.size.name)
        .toSet()
        .toList();
  }

  List<String> getAvailableColors(String size) {
    return widget.product.variants
        .where((variant) => variant.size.name == size)
        .map((variant) => variant.color.codeHexa)
        .toSet()
        .toList();
  }

  Color getColorFromHex(String colorString) {
    return Color(
        int.parse(colorString.replaceFirst('#', ''), radix: 16) + 0xFF000000);
  }

  void resetSelection() {
    setState(() {
      selectedColor = null;
      selectedSize = null;
    });
    productBloc.add(const ResetVariantEvent());
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

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
          Variant? selectedVariant;
          if (state is ProductError) {
            EasyLoading.showSuccess("Variant non trouvé");
            Future.delayed(const Duration(seconds: 2), () {
              EasyLoading.dismiss();
              Navigator.pop(context);
            });
          }
          if (state is ProductLoaded) {
            selectedVariant = state.selectedVariant;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CarouselSlider(
                      items: [
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image,
                            imageBuilder: (context, imageProvider) => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 450,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image,
                            imageBuilder: (context, imageProvider) => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 500,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentIndex,
                      count: 2,
                      effect: const WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: Colors.blueAccent,
                      ),
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Taille',
                            style: TextStyles.interMediumH5.copyWith(
                              color: Colours.colorsButtonMenu,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Wrap(
                            children: (selectedColor != null
                                    ? getAvailableSizes(selectedColor!)
                                    : uniqueSizes)
                                .map((size) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                    final availableColors =
                                        getAvailableColors(size);
                                    if (selectedColor != null &&
                                        !availableColors
                                            .contains(selectedColor)) {
                                      selectedColor = null;
                                      EasyLoading.showInfo(
                                          "La couleur sélectionnée n'est plus disponible pour cette taille.");
                                    }
                                    if (selectedColor != null) {
                                      productBloc.add(SelectVariantEvent(
                                        productId: widget.product.id,
                                        color: selectedColor!,
                                        size: selectedSize!,
                                      ));
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: selectedSize == size
                                          ? Colours.colorsButtonMenu
                                          : Colours.primaryPalette,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(size.substring(0, 1)),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Row(
                        children: [
                          Text(
                            'Couleur',
                            style: TextStyles.interMediumH5.copyWith(
                              color: Colours.colorsButtonMenu,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Wrap(
                            children: (selectedSize != null
                                    ? getAvailableColors(selectedSize!)
                                    : uniqueColors)
                                .map((color) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                    final availableSizes =
                                        getAvailableSizes(color);

                                    if (selectedSize != null &&
                                        !availableSizes
                                            .contains(selectedSize)) {
                                      selectedSize = null;
                                      EasyLoading.showInfo(
                                          "La taille sélectionnée n'est plus disponible pour cette couleur.");
                                    }

                                    if (selectedSize != null) {
                                      productBloc.add(SelectVariantEvent(
                                        productId: widget.product.id,
                                        color: selectedColor!,
                                        size: selectedSize!,
                                      ));
                                    }
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: getColorFromHex(color),
                                    border: selectedColor == color
                                        ? Border.all(
                                            color: Colours.colorsButtonMenu,
                                            width: 2)
                                        : null,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        style: CustomButtonStyle.customButtonStyle(
                          type: ButtonType.validButton,
                          isSelected: isSelected,
                        ),
                        onPressed: resetSelection,
                        child: const Text("Réinitialiser la sélection",
                            style: TextStyles.interMediumH5),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (selectedVariant != null) ...[
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
                  ] else
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
                      '\$${(widget.product.price / 100).toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: CustomButtonStyle.customButtonStyle(
                      type: ButtonType.cancelButton,
                      isSelected: isSelected,
                    ),
                    onPressed: selectedVariant != null
                        ? () {
                            // context.read<CartBloc>().add(AddProduct(
                            //     cartItem: CartItem(
                            //         product: widget.product,
                            //         variant: selectedVariant!)));

                            // context
                            //     .read<ProductBloc>()
                            //     .add(const ResetVariantEvent());
                            // Navigator.pop(context);
                            isSelected = !isSelected;
                          }
                        : null,
                    child: const Text('Ajouter au panier'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
