import 'package:flutter/material.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/features/authentification/presentation/pages/SignUpScreenPage.dart';
import 'package:pos_flutter/features/authentification/presentation/pages/sign_in_view_page.dart';

import 'package:pos_flutter/features/home/presentation/pages/MainViewPage.dart';

class AppRouter {
  // Routes
  static const String home = '/';
  static const String signUp = '/sign-up';
  static const String signIn = '/sign-in';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MainViewPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreenPage());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInViewPage());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
