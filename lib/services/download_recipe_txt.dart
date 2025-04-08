import 'dart:convert';
import 'dart:html' as html; 
import 'package:sacctol_dashboard/models/menu_item.dart';

void downloadReceiptAsTxt(List<MenuItem> items) {
  final timestamp = DateTime.now();
  final buffer = StringBuffer();

  buffer.writeln("Receipt - ${timestamp.toLocal()}");
  buffer.writeln("-----------------------------");

  double total = 0.0;
  for (var item in items) {
    buffer.writeln("${item.name}: \$${item.price.toStringAsFixed(2)}");
    total += item.price;
  }

  buffer.writeln("-----------------------------");
  buffer.writeln("Total: \$${total.toStringAsFixed(2)}");

  final content = buffer.toString();
  final blob = html.Blob([content]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "receipt_${timestamp.millisecondsSinceEpoch}.txt")
    ..click();
  html.Url.revokeObjectUrl(url);
}
