import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/modules/product_detail/product_detail.dart';
import 'package:nectar/modules/signin/signin_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/welcome/welcome_screen.dart';
import 'routes.dart';

class AppRouter {
  static final GoRouter instance = GoRouter(
    initialLocation: PageRoutes.root,
    routes: _routes,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.matchedLocation}')),
    ),
  );

  /// Route definitions
  static final List<RouteBase> _routes = [
    GoRoute(
      path: PageRoutes.root,
      name: 'welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: PageRoutes.home,
      name: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: PageRoutes.productDetail,
      name: AppRoutes.productDetail,
      builder: (context, state) => const ProductDetailsScreen(),
    ),
    GoRoute(
      path: PageRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) => const SigninScreen(),
    ),
  ];
}
