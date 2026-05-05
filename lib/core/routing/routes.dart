/// Route paths following web URL conventions
abstract class PageRoutes {
  static const String root = '/';
  // Auth Routes
  static const String login = '/${AppRoutes.login}';
  static const String number = '/${AppRoutes.number}';
  static const String verification = '/${AppRoutes.verification}';
  static const String selectLocation = '/${AppRoutes.selectLocation}';
  static const String authLogin = '/${AppRoutes.authLogin}';
  static const String signup = '/${AppRoutes.signup}';
  static const String notFound = '/${AppRoutes.notFound}';

  // bottom navigation routes
  static const String shop = '/${AppRoutes.shop}';
  static const String cart = '/${AppRoutes.cart}';
  static const String favorite = '/${AppRoutes.favorite}';
  static const String explore = '/${AppRoutes.explore}';
  static const String account = '/${AppRoutes.account}';

  static const String productDetail = '/${AppRoutes.productDetail}';
}

/// Route names for type-safe navigation
abstract class AppRoutes {
  // Auth Routes
  static const String login = 'login';
  static const String number = 'number';
  static const String verification = 'verification';
  static const String selectLocation = 'selectLocation';
  static const String authLogin = 'authLogin';
  static const String signup = 'signup';
  static const String notFound = '404';

  // bottom navigation routes
  static const String shop = 'shop';
  static const String cart = 'cart';
  static const String favorite = 'favorite';
  static const String explore = 'explore';
  static const String account = 'account';

  static const String productDetail = 'productDetail';
}
