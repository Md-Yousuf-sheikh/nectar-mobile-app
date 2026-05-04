/// Route paths following web URL conventions
abstract class PageRoutes {
  static const String root = '/';
  static const String home = '/${AppRoutes.home}';
  static const String productDetail = '/${AppRoutes.productDetail}';
  static const String login = '/${AppRoutes.login}';
  static const String notFound = '/${AppRoutes.notFound}';
}

/// Route names for type-safe navigation
abstract class AppRoutes {
  static const String home = 'home';
  static const String productDetail = 'productDetail';
  static const String login = 'login';
  static const String notFound = '404';
}
