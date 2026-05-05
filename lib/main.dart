import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar/core/routing/router.dart';
import 'package:nectar/core/store/auth_provider.dart';
import 'package:nectar/core/store/cart_provider.dart';
import 'package:nectar/core/store/counter_provider.dart';
import 'package:nectar/core/store/favorite_provider.dart';
import 'package:nectar/core/store/items_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.black,
  //     statusBarIconBrightness: Brightness.dark, // Android
  //     statusBarBrightness: Brightness.dark, // iOS
  //   ),
  // );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  final counterProvider = CounterProvider();
  final cartProvider = CartProvider();
  final favoriteProvider = FavoriteProvider();
  final authProvider = AuthProvider();

  await Future.wait([
    counterProvider.loadFromStorage(),
    cartProvider.loadFromStorage(),
    favoriteProvider.loadFromStorage(),
    authProvider.loadFromStorage(),
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>.value(value: counterProvider),
        ChangeNotifierProvider(create: (_) => ItemsProvider()),
        ChangeNotifierProvider<CartProvider>.value(value: cartProvider),
        ChangeNotifierProvider<FavoriteProvider>.value(value: favoriteProvider),
        ChangeNotifierProvider<AuthProvider>.value(value: authProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nectar',
      theme: ThemeData(
        // appBarTheme:
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      routerConfig: AppRouter.instance,
    );
  }
}
