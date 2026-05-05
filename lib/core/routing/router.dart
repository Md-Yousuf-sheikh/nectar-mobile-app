import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/widget/bottom_tabs/BottomTabs.dart';
import 'package:nectar/modules/account/account_screen.dart';
import 'package:nectar/modules/cart/cart_screen.dart';
import 'package:nectar/modules/explore/explore_screen.dart';
import 'package:nectar/modules/favorite/Favorite_screen.dart';
import 'package:nectar/modules/product_detail/product_detail.dart';
import 'package:nectar/modules/signin/login_screen.dart';
import 'package:nectar/modules/signin/number_screen.dart';
import 'package:nectar/modules/signin/select_location_screen.dart';
import 'package:nectar/modules/signin/signin_screen.dart';
import 'package:nectar/modules/signin/signup_screen.dart';
import 'package:nectar/modules/signin/verification_screen.dart';
import '../../modules/shop/shop_screen.dart';
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

    // Auth Routes
    GoRoute(
      path: PageRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) => const SigninScreen(),
    ),
    GoRoute(
      path: PageRoutes.number,
      name: AppRoutes.number,
      builder: (context, state) => const NumberScreen(),
    ),
    GoRoute(
      path: PageRoutes.verification,
      name: AppRoutes.verification,
      builder: (context, state) => const VerificationScreen(),
    ),
    GoRoute(
      path: PageRoutes.selectLocation,
      name: AppRoutes.selectLocation,
      builder: (context, state) => const SelectLocationScreen(),
    ),
    GoRoute(
      path: PageRoutes.authLogin,
      name: AppRoutes.authLogin,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: PageRoutes.signup,
      name: AppRoutes.signup,
      builder: (context, state) => const SignupScreen(),
    ),

    // bottom navigation routes
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.shop,
              name: AppRoutes.shop,
              builder: (context, state) => const ShopScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.cart,
              name: AppRoutes.cart,
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.favorite,
              name: AppRoutes.favorite,
              builder: (context, state) => const FavoriteScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.explore,
              name: AppRoutes.explore,
              builder: (context, state) => const ExploreScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.account,
              name: AppRoutes.account,
              builder: (context, state) => const AccountScreen(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomTabs(navigationShell: navigationShell),
        );
      },
    ),

    // others routes
    GoRoute(
      path: PageRoutes.productDetail,
      name: AppRoutes.productDetail,
      builder: (context, state) {
        final product = state.extra;
        return ProductDetailsScreen(
          product: product is Map<String, dynamic>
              ? product
              : const <String, dynamic>{},
        );
      },
    ),
  ];
}
