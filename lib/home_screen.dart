import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy data for food items
  final List<FoodItem> _allFoodItems = [
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Pizza', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Lasagna', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Roasted Chicken', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Chicken Sandwich', price: '\$12.50', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Veggie Burger', price: '\$15.00', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Pepperoni Pizza', price: '\$18.00', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'BBQ Chicken', price: '\$20.00', imagePath: 'assets/images/food_item.png'),
  ];

  List<FoodItem> _filteredFoodItems = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _filteredFoodItems = _allFoodItems;
  }

  void _filterFoodItems() {
    setState(() {
      _filteredFoodItems = _allFoodItems.where((item) {
        final matchesSearch = item.name.toLowerCase().contains(_searchQuery.toLowerCase());
        final matchesCategory = _selectedCategory == 'All' || item.name.toLowerCase().contains(_selectedCategory.toLowerCase());
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello 👋'),
            Text('Username', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: (query) {
                  _searchQuery = query;
                  _filterFoodItems();
                },
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications), 
            onPressed: () {
              // TODO: Implement notification action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotional Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF5722), Color(0xFFFF9800)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'DISCOUNT 20%',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Special\nBURGER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'From Fegegta Restaurant',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/burger_fries.png', // Placeholder image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('All', _selectedCategory == 'All'),
                    _buildCategoryChip('Burgers', _selectedCategory == 'Burgers'),
                    _buildCategoryChip('Pizza', _selectedCategory == 'Pizza'),
                    _buildCategoryChip('Chicken', _selectedCategory == 'Chicken'),
                    _buildCategoryChip('Drinks', _selectedCategory == 'Drinks'),
                    _buildCategoryChip('Desserts', _selectedCategory == 'Desserts'),
                  ],
                ),
              ),
            ),

            // Food Items Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: _filteredFoodItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredFoodItems[index];
                  return _buildFoodItemCard(
                    item.name,
                    item.price,
                    item.imagePath,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Liked',
          ),
        ],
        currentIndex: 0, // Set the initial selected tab
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // TODO: Implement navigation for bottom bar
        },
      ),
    );
  }

  Widget _buildCategoryChip(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategory = text;
            _filterFoodItems();
          });
        },
        child: Chip(
          label: Text(text),
          backgroundColor: isSelected ? const Color(0xFFFF5722) : Colors.grey[200],
          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildFoodItemCard(String name, String price, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepOrange),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.favorite_border, color: Colors.red),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


