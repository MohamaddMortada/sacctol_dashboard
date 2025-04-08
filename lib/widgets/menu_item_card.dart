import 'package:flutter/material.dart';
import 'package:sacctol_dashboard/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const MenuItemCard({required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        title: Text(item.name),
        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: onAdd,
        ),
      ),
    );
  }
}
