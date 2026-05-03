/// Route paths following web URL conventions
abstract class PageRoutes {
  static const String root = '/';
  static const String home = '/${AppRoutes.home}';
  static const String profile = '/${AppRoutes.profile}';
  static const String appointment = '/${AppRoutes.appointment}';
  static const String location = '/${AppRoutes.location}';
  static const String orders = '/${AppRoutes.orders}';
  static const String login = '/${AppRoutes.login}';
  static const String notFound = '/${AppRoutes.notFound}';
}

/// Route names for type-safe navigation
abstract class AppRoutes {
  static const String home = 'home';
  static const String profile = 'profile';
  static const String appointment = 'appointment';
  static const String location = 'location';
  static const String orders = 'orders';
  static const String login = 'login';
  static const String notFound = '404';
}
