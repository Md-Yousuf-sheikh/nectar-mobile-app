import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> accountItems = [
    //   {
    //     'title': 'My Orders',
    //     'icon': Icons.shopping_bag,
    //     'route': PageRoutes.productDetail,
    //   },
    //   {
    //     'title': 'My Details',
    //     'icon': Icons.shopping_bag,
    //     'route': PageRoutes.productDetail,
    //   },
    //   {
    //     'title': 'Delivery Address',
    //     'icon': Icons.shopping_bag,
    //     'route': PageRoutes.productDetail,
    //   },
    // ];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              // profile image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.person, size: 30),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 4,
                          children: [
                            Text(
                              'Ariful Islam',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: Icon(
                                Icons.edit,
                                size: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'ariful.islam@example.com',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 2, color: Colors.grey.shade300),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("hh"));
                },
              ),
              // list of items
            ],
          ),
        ),
      ),
    );
  }
}
