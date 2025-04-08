import 'dart:convert';
import 'package:sacctol_dashboard/models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReceiptStorage {
  static const _key = 'saved_receipts';

  Future<void> saveReceipt(Receipt receipt) async {
  final prefs = await SharedPreferences.getInstance();
  final existing = await getReceipts();
  existing.add(receipt);

  final encoded = existing.map((r) => jsonEncode(r.toJson())).toList();
  await prefs.setStringList(_key, encoded);
}


  Future<List<Receipt>> getReceipts() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getStringList(_key) ?? [];

    return encoded
        .map((str) => Receipt.fromJson(jsonDecode(str)))
        .toList();
  }

  Future<void> deleteReceipt(Receipt receipt) async {
    final prefs = await SharedPreferences.getInstance();
    final receipts = await getReceipts();

    receipts.removeWhere((r) =>
        r.timestamp.toIso8601String() == receipt.timestamp.toIso8601String());

    final encoded = receipts.map((r) => jsonEncode(r.toJson())).toList();
    await prefs.setStringList(_key, encoded);
  }

  Future<double> getTotalRevenue() async {
  final receipts = await getReceipts();
  return receipts.fold<double>(0.0, (sum, r) => sum + r.total);
}

}
