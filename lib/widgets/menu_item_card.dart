import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl
import 'package:sacctol_dashboard/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const MenuItemCard({required this.item, required this.onAdd, super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat("#,##0", "en_US");

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              '${currencyFormatter.format(item.price)} L.L',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
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
