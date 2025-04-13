import 'package:flutter/material.dart';
import 'package:sacctol_dashboard/models/menu_item.dart';
import 'package:sacctol_dashboard/screens/basket_screen.dart';
import 'package:sacctol_dashboard/screens/saved_recipes_screen.dart';
import 'package:sacctol_dashboard/widgets/menu_item_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MenuItem> menuItems = [

    // Ice Cream
  MenuItem(name: 'Small Cone', category: 'Ice Cream', price: 100000),
  MenuItem(name: 'Mix Cone', category: 'Ice Cream', price: 250000),
  MenuItem(name: 'Large Cone', category: 'Ice Cream', price: 250000),
  MenuItem(name: 'One Boule', category: 'Ice Cream', price: 100000),
  MenuItem(name: 'Achta Cone', category: 'Ice Cream', price: 300000),
  MenuItem(name: '500 G Mix', category: 'Ice Cream', price: 450000),
  MenuItem(name: '1kg Mix', category: 'Ice Cream', price: 1000080), // 12
  MenuItem(name: '1kg Achta', category: 'Ice Cream', price: 1260000),
  MenuItem(name: 'Add ons', category: 'Ice Cream', price: 50000),

    // Crepe
  MenuItem(name: 'Nutella', category: 'Crepe', price: 300000),
  MenuItem(name: 'Kinder', category: 'Crepe', price: 350000),
  MenuItem(name: 'Lotus', category: 'Crepe', price: 350000),
  MenuItem(name: "Hershey's", category: 'Crepe', price: 350000),
  MenuItem(name: 'Sushi Crepe', category: 'Crepe', price: 72000),  // 0.8$
  MenuItem(name: 'Fettuccine', category: 'Crepe', price: 450000),
  MenuItem(name: 'Pancake', category: 'Crepe', price: 450000),
  MenuItem(name: 'Addons', category: 'Crepe', price: 50000),

  // Frappe
  MenuItem(name: 'Caramel M', category: 'Frappe', price: 250000),
  MenuItem(name: 'Caramel L', category: 'Frappe', price: 350000),
  MenuItem(name: 'Mocha M', category: 'Frappe', price: 250000),
  MenuItem(name: 'Mocha L', category: 'Frappe', price: 350000),
  MenuItem(name: 'White Mocha M', category: 'Frappe', price: 250000),
  MenuItem(name: 'White Mocha L', category: 'Frappe', price: 350000),
  MenuItem(name: 'Tiramisu M', category: 'Frappe', price: 250000),
  MenuItem(name: 'Tiramisu L', category: 'Frappe', price: 350000),
  MenuItem(name: 'Irish M', category: 'Frappe', price: 250000),
  MenuItem(name: 'Irish L', category: 'Frappe', price: 350000),
  MenuItem(name: 'Coffee Lovers M', category: 'Frappe', price: 250000),
  MenuItem(name: 'Coffee Lovers L', category: 'Frappe', price: 350000),
  MenuItem(name: 'Add ons', category: 'Crepe', price: 50000),



  // Milkshakes
  MenuItem(name: 'Strawberry M', category: 'Milkshakes', price: 250000),
  MenuItem(name: 'Strawberry L', category: 'Milkshakes', price: 350000),
  MenuItem(name: 'oreo M', category: 'Milkshakes', price: 250000),
  MenuItem(name: 'oreo L', category: 'Milkshakes', price: 350000),
  MenuItem(name: 'Lotus M', category: 'Milkshakes', price: 250000),
  MenuItem(name: 'Lotus L', category: 'Milkshakes', price: 350000),
  MenuItem(name: 'Chocolate M', category: 'Milkshakes', price: 250000),
  MenuItem(name: 'Chocolate L', category: 'Milkshakes', price: 350000),
  MenuItem(name: 'Caramel M', category: 'Milkshakes', price: 250000),
  MenuItem(name: 'Caramel L', category: 'Milkshakes', price: 350000),
  MenuItem(name: 'Bubble Gum M', category: 'Milkshakes', price: 250000),
  MenuItem(name: 'Bubble Gum L', category: 'Milkshakes', price: 350000),
  MenuItem(name: 'Protien M', category: 'Milkshakes', price: 250000),
  MenuItem(name: 'Protien L', category: 'Milkshakes', price: 350000),
  MenuItem(name: 'Add ons', category: 'Milkshakes', price: 50000),
  

  // Smoothies
  MenuItem(name: 'Strawberry M', category: 'Smoothies', price: 200000),
  MenuItem(name: 'Strawberry L', category: 'Smoothies', price: 300000),
  MenuItem(name: 'Peach M', category: 'Smoothies', price: 200000),
  MenuItem(name: 'Peach L', category: 'Smoothies', price: 300000),
  MenuItem(name: 'Dragon Fruit M', category: 'Smoothies', price: 200000),
  MenuItem(name: 'Dragon Fruit L', category: 'Smoothies', price: 300000),
  MenuItem(name: 'Lemonade M', category: 'Smoothies', price: 200000),
  MenuItem(name: 'Lemonade L', category: 'Smoothies', price: 300000),
  MenuItem(name: 'Minted Lemonade M', category: 'Smoothies', price: 250000),
  MenuItem(name: 'Minted Lemonade L', category: 'Smoothies', price: 350000),
  MenuItem(name: 'Add ons', category: 'Smoothies', price: 50000),

  // Fresh Juices
  MenuItem(name: 'Avoca M', category: 'Fresh Juices', price: 400000), // 4.4$
  MenuItem(name: 'Avoca L', category: 'Fresh Juices', price: 450000), // 5$
  MenuItem(name: 'Avoca 1L', category: 'Fresh Juices', price: 720000), // 8$
  MenuItem(name: 'Cocktail She2af M', category: 'Fresh Juices', price: 400000), // 4.4$
  MenuItem(name: 'Cocktail She2af L', category: 'Fresh Juices', price: 450000), // 5$
  MenuItem(name: 'Cocktail M', category: 'Fresh Juices', price: 200000), // 2.2$
  MenuItem(name: 'Cocktail L', category: 'Fresh Juices', price: 300000), // 3.3$
  MenuItem(name: 'Cocktail 1L', category: 'Fresh Juices', price: 450000), // 5$
  MenuItem(name: 'Strawberry M', category: 'Fresh Juices', price: 150000), // 1.7$
  MenuItem(name: 'Strawberry L', category: 'Fresh Juices', price: 200000), // 2.2$
  MenuItem(name: 'Strawberry 1L', category: 'Fresh Juices', price: 300000), // 3.33$
  MenuItem(name: 'Mango M', category: 'Fresh Juices', price: 150000), // 1.7$
  MenuItem(name: 'Mango L', category: 'Fresh Juices', price: 200000), // 2.2$
  MenuItem(name: 'Mango 1L', category: 'Fresh Juices', price: 345000), // 3.8$
  MenuItem(name: 'Orange M', category: 'Fresh Juices', price: 98000), // 1.1$
  MenuItem(name: 'Orange L', category: 'Fresh Juices', price: 150000), // 1.66$
  MenuItem(name: 'Orange 1L', category: 'Fresh Juices', price: 270000), // 3$
  MenuItem(name: 'Carrot M', category: 'Fresh Juices', price: 100000), // 1.1$
  MenuItem(name: 'Carrot L', category: 'Fresh Juices', price: 150000), // 1.66$
  MenuItem(name: 'Carrot 1L', category: 'Fresh Juices', price: 270000), // 3$
  MenuItem(name: 'Achta sa7en', category: 'Fresh Juices', price: 450000),
  MenuItem(name: 'Add ons', category: 'Fresh Juices', price: 50000),


  // Candies
  MenuItem(name: '150g', category: 'Candies', price: 100000),
  MenuItem(name: 'Gelatine Cup', category: 'Candies', price: 100000),
  MenuItem(name: 'Eyes Cup', category: 'Candies', price: 130000),

  // Merry Cream
  MenuItem(name: 'Small Cone', category: 'Merry Cream', price: 100000),
  MenuItem(name: 'Meduim Cone', category: 'Merry Cream', price: 200000),
  MenuItem(name: 'Large Cone', category: 'Merry Cream', price: 300000),
  MenuItem(name: 'Extra Large', category: 'Merry Cream', price: 350000),
  MenuItem(name: 'Oreo Cup', category: 'Merry Cream', price: 200000),
  MenuItem(name: 'Lotus Cup', category: 'Merry Cream', price: 200000),
  MenuItem(name: 'Strawberry Cup', category: 'Merry Cream', price: 200000),
  MenuItem(name: 'Kinder Cup', category: 'Merry Cream', price: 250000),
  MenuItem(name: 'Add ons', category: 'Merry Cream', price: 50000),

  // Hot Drinks
  MenuItem(name: 'Espresso', category: 'Hot Drinks', price: 50000),
  MenuItem(name: 'Espresso Macchiato', category: 'Hot Drinks', price: 100000),
  MenuItem(name: 'Americano', category: 'Hot Drinks', price: 150000),
  MenuItem(name: 'Passion Fruit', category: 'Hot Drinks', price: 100000),
  MenuItem(name: 'Berries', category: 'Hot Drinks', price: 100000),
  MenuItem(name: 'Green With Mint', category: 'Hot Drinks', price: 100000),
  MenuItem(name: 'Lemon Ginger', category: 'Hot Drinks', price: 100000),
  MenuItem(name: 'Hot Chocolate', category: 'Hot Drinks', price: 200000),
  MenuItem(name: 'Bubble Gum', category: 'Hot Drinks', price: 200000),
  MenuItem(name: 'Strawberry', category: 'Hot Drinks', price: 200000),
  MenuItem(name: 'Add ons', category: 'Hot Drinks', price: 50000),

  // Latte
  MenuItem(name: 'Tiramisu', category: 'Latte', price: 200000),
  MenuItem(name: 'Caramel', category: 'Latte', price: 200000),
  MenuItem(name: 'Chocolate', category: 'Latte', price: 200000),
  MenuItem(name: 'Cookie', category: 'Latte', price: 200000),
  MenuItem(name: 'Speculoos', category: 'Latte', price: 200000),
  MenuItem(name: 'Add ons', category: 'Latte', price: 50000),
];
  final List<MenuItem> basket = [];

  void addToBasket(MenuItem item) {
    setState(() {
      basket.add(item);
    });
  }

  void showBasket() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BasketScreen(basket: basket, onItemDeleted: _removeItem),
      ),
    );
  }

  void _removeItem(MenuItem item) {
    setState(() {
      basket.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = menuItems.map((e) => e.category).toSet().toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 160.0;
    final itemHeight = 200.0;
    final crossAxisCount = (screenWidth / itemWidth).floor();

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Basket App'),
        actions: [
          IconButton(
            icon: Icon(Icons.receipt),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SavedReceiptsScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: showBasket,
          )
        ],
      ),
      body: ListView(
        children: categories.map((category) {
          final items = menuItems.where((item) => item.category == category).toList();
          final rows = (items.length / crossAxisCount).ceil();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: rows * itemHeight,
                child: GridView.count(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: itemWidth / itemHeight,
                  physics: NeverScrollableScrollPhysics(),
                  children: items.map((item) {
                    return Center(
                      child: SizedBox(
                        width: itemWidth,
                        height: itemHeight,
                        child: MenuItemCard(
                          item: item,
                          onAdd: () => addToBasket(item),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
