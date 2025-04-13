import 'package:flutter/material.dart';
import 'package:sacctol_dashboard/models/menu_item.dart';

class BasketBottomSheet extends StatelessWidget {
  final List<MenuItem> basket;

  const BasketBottomSheet({required this.basket});

  @override
  Widget build(BuildContext context) {
    double total = basket.fold(0, (sum, item) => sum + item.price);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your Basket',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...basket.map((item) => ListTile(
                title: Text(item.name),
                trailing: Text('${item.price} L.L'),
              )),
          Divider(),
          ListTile(
            title: Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '${total} L.L',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
