import 'package:flutter/material.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/features/authentification/presentation/pages/SignUpScreenPage.dart';
import 'package:pos_flutter/features/authentification/presentation/pages/sign_in_view_page.dart';

import 'package:pos_flutter/features/home/presentation/pages/MainViewPage.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/presentation/pages/product_details_view_page.dart';
import 'package:pos_flutter/features/products/presentation/pages/product_view_page.dart';

class AppRouter {
  // Routes
  static const String home = '/';
  static const String signUp = '/sign-up';
  static const String signIn = '/sign-in';
  static const String productDetailsViewPage = '/product-details';
  static const String productViewPage = '/product';
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MainViewPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreenPage());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInViewPage());
      case productViewPage:
        return MaterialPageRoute(builder: (_) => const ProductViewPage());
      case productDetailsViewPage:
        Product product = routeSettings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailsViewPage(product: product));
      default:
        throw const RouteException('Route not found!');
    }
  }
}
