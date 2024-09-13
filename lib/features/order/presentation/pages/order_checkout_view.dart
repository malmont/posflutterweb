import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pos_flutter/core/router/app_router.dart';
import 'package:pos_flutter/di/injection_container.dart';
import 'package:pos_flutter/features/cart/application/blocs/cart_bloc.dart';
import 'package:pos_flutter/features/cart/domain/entities/cart_item.dart';
import 'package:pos_flutter/features/cart/presentation/widgets/input_form_button.dart';
import 'package:pos_flutter/features/order/application/blocs/order_add/order_add_cubit.dart';
import 'package:pos_flutter/features/order/domain/entities/order_detail_response.dart';
import 'package:pos_flutter/features/order/presentation/widgets/outline_label_card.dart';

class OrderCheckoutView extends StatelessWidget {
  final List<CartItem> items;
  const OrderCheckoutView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    int deliveryCharge = 0;
    return BlocProvider(
      create: (context) => getIt<OrderAddCubit>(),
      child: BlocListener<OrderAddCubit, OrderAddState>(
        listener: (context, state) {
          EasyLoading.dismiss();
          if (state is OrderAddLoading) {
            EasyLoading.show(status: 'Loading...');
          } else if (state is OrderAddSuccess) {
            context.read<CartBloc>().add(const ClearCart());
            Navigator.of(context).pop();
            EasyLoading.showSuccess("Order Placed Successfully");
          } else if (state is OrderAddFail) {
            EasyLoading.showError("Error");
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Order Checkout'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                OutlineLabelCard(
                  title: 'Selected Products',
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 8),
                    child: Column(
                      children: items
                          .map((product) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 75,
                                      child: AspectRatio(
                                        aspectRatio: 0.88,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl: product.product.image,
                                              ),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.product.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$${(product.product.price / 100).toStringAsFixed(2)}',
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'x${product.quantity}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Affichage de la taille
                                                  Wrap(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 5,
                                                                vertical: 2),
                                                        margin: const EdgeInsets
                                                            .all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Text(
                                                          product
                                                              .variant.size.name
                                                              .substring(0, 1),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Wrap(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .all(4),
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(int.parse(
                                                                  product
                                                                      .variant
                                                                      .color
                                                                      .codeHexa
                                                                      .replaceFirst(
                                                                          '#',
                                                                          ''),
                                                                  radix: 16) +
                                                              0xFF000000),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                              width: 2),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                OutlineLabelCard(
                  title: 'Order Summery',
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total Number of Items"),
                            BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                              if (state.cart.isEmpty) {
                                return const SizedBox();
                              }

                              return Text("x${state.totalItems}");
                            }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total Price"),
                            Text(
                                '\$${(items.fold(0.0, (previousValue, element) => ((element.product.price * element.quantity) + previousValue)) / 100).toStringAsFixed(2)}'),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Delivery Charge"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${(deliveryCharge / 100).toStringAsFixed(2)}', // Affichage correct du montant
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total"),
                                Text(
                                    '\$${((items.fold(0.0, (previousValue, element) => (((element.product.price * element.quantity) + previousValue)) + deliveryCharge) / 100)).toStringAsFixed(2)}')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Builder(builder: (context) {
                return InputFormButton(
                  color: Colors.black87,
                  onClick: () {
                    context.read<OrderAddCubit>().addOrder(OrderDetailResponse(
                        orderSource: 3,
                        addressId: 1,
                        paymentMethod: 1,
                        carrierId: 1,
                        typeOrder: 1,
                        items: items
                            .map((e) => OrderItemDetail(
                                  productVariantId: e.variant.id,
                                  quantity: e.quantity,
                                ))
                            .toList()));

                    context.read<OrderAddCubit>().stream.listen((state) {
                      if (state is OrderAddSuccess) {
                        EasyLoading.showSuccess("Order Placed Successfully");
                        context.read<CartBloc>().add(const ClearCart());
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRouter.home, (Route<dynamic> route) => false);
                      } else if (state is OrderAddFail) {
                        EasyLoading.showError("Error placing order");
                      }
                    });
                  },
                  titleText: 'Confirm',
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
