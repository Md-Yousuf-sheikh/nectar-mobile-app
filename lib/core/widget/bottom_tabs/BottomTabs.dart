import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabs extends StatelessWidget {
  const BottomTabs({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  int _getCurrentIndex() {
    return navigationShell.currentIndex;
  }

  void _onTap(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final selectedColor = Colors.green;
    final unselectedColor = scheme.onSurfaceVariant;

    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(),
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      items: [
        BottomNavigationBarItem(
          label: 'Shop',
          icon: SvgPicture.asset(
            'assets/svg/shop_icon.svg',
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/svg/shop_icon.svg',
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: SvgPicture.asset(
            'assets/svg/cart_icon.svg',
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/svg/cart_icon.svg',
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Favorite',
          icon: SvgPicture.asset(
            'assets/svg/favorite_icon.svg',
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/svg/favorite_icon.svg',
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Explore',
          icon: SvgPicture.asset(
            'assets/svg/explore_icon.svg',
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/svg/explore_icon.svg',
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: SvgPicture.asset(
            'assets/svg/user_icon.svg',
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/svg/user_icon.svg',
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
