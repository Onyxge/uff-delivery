import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_item.dart';

class DiscoveryScreen extends StatelessWidget {
  DiscoveryScreen({super.key});

  final List<FoodItem> discoveryItems = [
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
    FoodItem(name: 'Special Burger', price: '\$17.75', imagePath: 'assets/images/food_item.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                itemCount: discoveryItems.length,
                itemBuilder: (context, index) {
                  final item = discoveryItems[index];
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
        currentIndex: 1, // Set the initial selected tab to Discover
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // TODO: Implement navigation for bottom bar
        },
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


