import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/features/cart/application/blocs/cart_bloc.dart';
import 'package:pos_flutter/features/cart/domain/entities/cart_item.dart';
import 'package:pos_flutter/features/cart/presentation/pages/cart_view_page.dart';
import 'package:pos_flutter/features/order/presentation/pages/order_checkout_view.dart';
import 'package:pos_flutter/features/order/presentation/widgets/flip_card.dart';

class CartCheckoutFlipPage extends StatefulWidget {
  const CartCheckoutFlipPage({super.key});

  @override
  CartCheckoutFlipPageState createState() => CartCheckoutFlipPageState();
}

class CartCheckoutFlipPageState extends State<CartCheckoutFlipPage> {
  List<CartItem> cartItems = [];
  bool isCheckoutView = false;
  void _onOrderPlaced() {
    setState(() {
      isCheckoutView = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Commande validée !')),
      );
    });
  }

  void _onCheckoutPressed() {
    if (cartItems.isNotEmpty) {
      setState(() {
        isCheckoutView = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Le panier est vide')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state.cart.isEmpty) {
            setState(() {
              cartItems = [];
            });
          } else {
            setState(() {
              cartItems = state.cart;
            });
          }
        },
        child: Scaffold(
          body: FlipCard(
            isFront: !isCheckoutView,
            front: CartViewPage(
              onCheckoutPressed: _onCheckoutPressed,
            ),
            back: OrderCheckoutView(
              items: cartItems,
              onOrderPlaced: _onOrderPlaced,
            ),
          ),
        ));
  }
}
