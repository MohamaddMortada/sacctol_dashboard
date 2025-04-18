import 'package:flutter/material.dart';
import 'package:sacctol_dashboard/models/recipe.dart';
import 'package:sacctol_dashboard/services/recipe_storage.dart';

class SavedReceiptsScreen extends StatefulWidget {
  @override
  _SavedReceiptsScreenState createState() => _SavedReceiptsScreenState();
}

class _SavedReceiptsScreenState extends State<SavedReceiptsScreen> {
  List<Receipt> _receipts = [];
  double _totalRevenue = 0.0;

  @override
  void initState() {
    super.initState();
    _loadReceipts();
  }

  Future<void> _loadReceipts() async {
    final receipts = await ReceiptStorage().getReceipts();

    final total = await ReceiptStorage().getTotalRevenue();

    setState(() {
      _receipts = receipts;
      _totalRevenue = total;
    });
  }

  Future<void> _deleteReceipt(Receipt receipt) async {
    await ReceiptStorage().deleteReceipt(receipt);
    await _loadReceipts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Receipts"),
      ),
      body: Column(
        children: [
          Expanded(
            child: _receipts.isEmpty
                ? Center(child: Text("No receipts saved."))
                : ListView.builder(
                    itemCount: _receipts.length,
                    itemBuilder: (context, index) {
                      final receipt = _receipts[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ExpansionTile(
                          title: Text(
                            "Receipt - ${receipt.timestamp.toLocal().toString().split('.')[0]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Total: \$${receipt.total.toStringAsFixed(2)}",
                          ),
                          children: [
                            ...receipt.items.map((item) => ListTile(
                                  title: Text(item.name),
                                  trailing: Text(
                                      "\$${item.price.toStringAsFixed(2)}"),
                                )),
                            TextButton.icon(
                              onPressed: () => _deleteReceipt(receipt),
                              icon: Icon(Icons.delete, color: Colors.red),
                              label: Text("Delete", style: TextStyle(color: Colors.red)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(
                "Total Revenue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "\$${_totalRevenue.toStringAsFixed(2)}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
