import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/routing/routes.dart';
import 'package:nectar/core/store/auth_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    // Defined list of items for better maintainability
    final List<Map<String, dynamic>> accountItems = [
      {'title': 'Orders', 'icon': Icons.shopping_bag_outlined},
      {'title': 'My Details', 'icon': Icons.badge_outlined},
      {'title': 'Delivery Address', 'icon': Icons.location_on_outlined},
      {'title': 'Payment Methods', 'icon': Icons.credit_card_outlined},
      {'title': 'Promo Cord', 'icon': Icons.confirmation_number_outlined},
      {'title': 'Notifications', 'icon': Icons.notifications_none_outlined},
      {'title': 'Help', 'icon': Icons.help_outline},
      {'title': 'About', 'icon': Icons.info_outline},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ), // Replace with actual image
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              auth.name.isNotEmpty ? auth.name : 'Guest User',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              Icons.edit_outlined,
                              size: 18,
                              color: Colors.green.shade600,
                            ),
                          ],
                        ),
                        Text(
                          auth.email.isNotEmpty
                              ? auth.email
                              : 'guest@nectar.app',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Divider(height: 1),

              // Menu List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: accountItems.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, indent: 20),
                itemBuilder: (context, index) {
                  final item = accountItems[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    leading: Icon(item['icon'], color: Colors.black87),
                    title: Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                    onTap: () {
                      // Navigate using your PageRoutes logic
                    },
                  );
                },
              ),
              const Divider(height: 1),

              // Logout Button
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      context.read<AuthProvider>().logout();
                      context.go(PageRoutes.authLogin);
                    },
                    icon: const Icon(Icons.logout, color: Colors.green),
                    label: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
