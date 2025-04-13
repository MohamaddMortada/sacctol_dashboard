import 'package:flutter/material.dart';
import 'package:sacctol_dashboard/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const MenuItemCard({required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            Text('${item.price} L.L', style: TextStyle(fontSize: 14)),
            ElevatedButton(
              onPressed: onAdd,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
