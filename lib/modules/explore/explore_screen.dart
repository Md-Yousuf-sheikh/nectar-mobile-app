import 'package:flutter/material.dart';
import 'package:nectar/modules/explore/widget/explore_product_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _items = const [
    {
      'title': 'Fresh Fruits & Vegetable',
      'image': 'assets/images/items/01.png',
      'color': Color(0xff53B175),
    },
    {
      'title': 'Cooking Oil & Ghee',
      'image': 'assets/images/items/02.png',
      'color': Color(0xffF8A44C),
    },
    {
      'title': 'Meat & Fish',
      'image': 'assets/images/items/03.png',
      'color': Color(0xffF7A593),
    },
    {
      'title': 'Bakery & Snacks',
      'image': 'assets/images/items/04.png',
      'color': Color(0xffD3B0E0),
    },
    {
      'title': 'Dairy & Eggs',
      'image': 'assets/images/items/05.png',
      'color': Color(0xffFDE598),
    },
    {
      'title': 'Beverages',
      'image': 'assets/images/items/06.png',
      'color': Color(0xffB7DFF5),
    },
  ];

  late List<Map<String, dynamic>> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchItems(String query) {
    final searchText = query.trim().toLowerCase();

    // Search works by keeping _items unchanged as the full source list.
    // Every time the user types, _filteredItems is rebuilt with titles that
    // contain the search text, then setState refreshes the grid.
    setState(() {
      if (searchText.isEmpty) {
        _filteredItems = _items;
      } else {
        _filteredItems = _items.where((item) {
          final title = (item['title'] as String).toLowerCase();
          return title.contains(searchText);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Find Products',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              onChanged: _searchItems,
              decoration: InputDecoration(
                hintText: 'Search Store',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF2F3F2),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // _items list
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(
                    child: Text(
                      'No items found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                    itemCount: _filteredItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.86,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                    itemBuilder: (context, index) {
                      return ExploreProductCard(item: _filteredItems[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
