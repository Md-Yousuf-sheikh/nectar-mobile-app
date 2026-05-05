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
    final selectedColor = scheme.primary;
    final unselectedColor = scheme.onSurfaceVariant;

    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(),
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      // selectedItemColor: activeColor,
      // selectedFontSize: labelFontSize,
      // unselectedFontSize: labelFontSize,
      selectedLabelStyle: TextStyle(
        // fontSize: labelFontSize,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        // fontSize: labelFontSize,
        fontWeight: FontWeight.normal,
      ),

      items: [
        BottomNavigationBarItem(
          label: 'Shop',
          backgroundColor: Colors.red,

          icon: SvgPicture.asset(
            'assets/svg/shop_icon.svg',
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/svg/shop_icon.svg',
            colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
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
            colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
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
            colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
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
            colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
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
            colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
          ),
        ),
      ],
      // onTap: (index) {
      //   switch (index) {
      //     case 0:
      //       context.go(PageRoutes.shop);
      //       break;
      //     case 1:
      //       context.go(PageRoutes.cart);
      //       break;
      //     case 2:
      //       context.go(PageRoutes.favorite);
      //       break;
      //     case 3:
      //       context.go(PageRoutes.explore);
      //       break;
      //     case 4:
      //       context.go(PageRoutes.account);
      //       break;

      //     default:
      //       break;
      //   }
      // },
    );
  }
}
