import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/features/cart/presentation/pages/cart_view_page.dart';
import 'package:pos_flutter/features/products/application/blocs/product_bloc.dart';
import 'package:pos_flutter/features/products/domain/entities/categoty/category.dart';
import 'package:pos_flutter/features/products/domain/entities/product/filter_product_params.dart';
import 'package:pos_flutter/features/products/presentation/widgets/alert_card.dart';
import 'package:pos_flutter/features/products/presentation/widgets/article_card.dart';
import 'package:pos_flutter/features/products/presentation/widgets/category_list.dart';
import 'package:pos_flutter/features/products/presentation/widgets/header.dart';
import 'package:provider/provider.dart';

import '../../../../design/design.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({super.key});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  final ScrollController scrollController = ScrollController();
  int selectedCategoryId = 5;
  bool isSelected = true;

  void _scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollPercentage = 0.7;

    if (currentScroll > (maxScroll * scrollPercentage)) {
      if (context.read<ProductBloc>().state is ProductLoaded &&
          !context.read<ProductBloc>().isFetching) {
        final state = context.read<ProductBloc>().state as ProductLoaded;
        if (state.metaData.total > state.products.length) {
          context.read<ProductBloc>().add(const GetMoreProducts());
        }
      }
    }
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<Category> categories = [
      Category(
        id: 1,
        name: 'Vêtements',
        description: 'Fashion items',
        image:
            'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      ),
      Category(
        id: 2,
        name: 'Accessoires',
        description: 'Accessories',
        image:
            'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      ),
      Category(
        id: 3,
        name: 'Chaussures',
        description: 'Shoes',
        image:
            'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      ),
      Category(
        id: 4,
        name: 'Chaussures',
        description: 'Shoes',
        image:
            'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      ),
      Category(id: 5, name: 'All', description: 'Tous les produits', image: ''),
    ];

    return Scaffold(
      backgroundColor: Colours.primary100,
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  onSearchSubmitted: (val) {
                    context
                        .read<ProductBloc>()
                        .add(GetProducts(FilterProductParams(keyword: val)));
                  },
                ),
                CategoryList(
                  categories: categories,
                  selectedCategoryId: selectedCategoryId,
                  onCategorySelected: (id) {
                    setState(() {
                      selectedCategoryId = id;
                      if (id == 5) {
                        context
                            .read<ProductBloc>()
                            .add(const GetProducts(FilterProductParams()));
                      } else {
                        context.read<ProductBloc>().add(GetProducts(
                                FilterProductParams(categories: [
                              categories.firstWhere((c) => c.id == id)
                            ])));
                      }
                    });
                  },
                ),
                Expanded(
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoaded && state.products.isEmpty) {
                        return AlertCard(
                          image: AppAssets.empty,
                          message: "Products not found!",
                        );
                      }
                      if (state is ProductError && state.products.isEmpty) {
                        if (state.failure is NetworkFailure) {
                          return AlertCard(
                            image: AppAssets.noConnection,
                            message: "Network failure\nTry again!",
                            onClick: () {
                              context.read<ProductBloc>().add(const GetProducts(
                                  FilterProductParams(keyword: '')));
                            },
                          );
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.failure is ServerFailure)
                              Image.asset(
                                AppAssets.internalServerError,
                                width: 600,
                              ),
                            if (state.failure is CacheFailure)
                              Image.asset(AppAssets.noConnection),
                            const Text("Products not found!"),
                            IconButton(
                              onPressed: () {
                                context.read<ProductBloc>().add(
                                    const GetProducts(
                                        FilterProductParams(keyword: '')));
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                          ],
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<ProductBloc>()
                              .add(const GetProducts(FilterProductParams()));
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: Units.edgeInsetsLarge),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(Units.edgeInsetsLarge),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 0.75,
                              ),
                              itemCount: state.products.length,
                              controller: scrollController,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: Units.sizedbox_30,
                                    ),
                                    ArticleCard(article: state.products[index]),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoaded &&
                        state.products.length >= state.metaData.total) {
                      return const Padding(
                        padding: EdgeInsets.all(Units.edgeInsetsXXLarge),
                        child: Center(
                          child: Text("Tous les produits ont été chargés.",
                              style: TextStyle(color: Colours.shadowHideMenu)),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: CartViewPage(
              isSelected: isSelected,
              onCancel: () => setState(() {}),
              onCancelPressed: () {},
              onSelectedPressed: () {},
              onValidPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
