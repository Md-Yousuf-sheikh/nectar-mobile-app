import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(),
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
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
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_card_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
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
