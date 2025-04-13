import 'package:flutter/material.dart';
import 'package:sacctol_dashboard/models/menu_item.dart';
import 'package:sacctol_dashboard/models/recipe.dart';
import 'package:sacctol_dashboard/services/download_recipe_txt.dart';
import 'package:sacctol_dashboard/services/recipe_storage.dart';

class BasketScreen extends StatefulWidget {
  final List<MenuItem> basket;
  final Function(MenuItem) onItemDeleted;

  const BasketScreen({required this.basket, required this.onItemDeleted});

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  late List<MenuItem> localBasket;

  @override
  void initState() {
    super.initState();
    localBasket = List.from(widget.basket);
  }

  void _deleteItem(MenuItem item) {
    setState(() {
      localBasket.remove(item);
    });
    widget.onItemDeleted(item);
  }

  void _showReceiptDialog(BuildContext context, List<MenuItem> basket) {
    double total = basket.fold(0, (sum, item) => sum + item.price);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Receipt"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...basket.map(
                  (item) =>
                      Text('${item.name}: ${item.price} L.L'),
                ),
                Divider(),
                Text(
                  'Total: ${total} L.L',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () async {
                final receipt = Receipt(
                  timestamp: DateTime.now(),
                  items: List.from(basket),
                );
                await ReceiptStorage().saveReceipt(receipt);
                print("Receipt saved!");
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),

            TextButton(
              onPressed: () {
                downloadReceiptAsTxt(basket);
              },
              child: Text('Download'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = localBasket.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Basket"),
        actions: [
          TextButton(
            onPressed: () => _showReceiptDialog(context, localBasket),
            child: Text("Print Receipt", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body:
          localBasket.isEmpty
              ? Center(child: Text("Basket is empty"))
              : ListView(
                children:
                    localBasket.map((item) {
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('${item.price} L.L'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteItem(item),
                        ),
                      );
                    }).toList(),
              ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(
            'Total: ${total} L.L',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
