import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:sacctol_dashboard/models/menu_item.dart';

void downloadReceiptAsTxt(List<MenuItem> items) {
  final timestamp = DateTime.now();
  final buffer = StringBuffer();
  final formatter = NumberFormat("#,###");
  const width = 20;

  // Header
  buffer.writeln(centerText("SACCTOL", width));
  buffer.writeln(centerText("Zawtar El-Charqieh", width));
  buffer.writeln(centerText("Center Swaydan", width));
  buffer.writeln(centerText("+961 81 58 63 34", width));
  buffer.writeln(centerText(timestamp.toLocal().toString().split('.')[0], width));
  buffer.writeln(repeat("", width));
  buffer.writeln(repeat("-", width));
  buffer.writeln(repeat("", width));

  double total = 0.0;
  for (var item in items) {
    final line = formatItemLine(item.name, item.price, formatter, width);
    buffer.writeln(line);
    total += item.price;
  }
  buffer.writeln(repeat("", width));
  buffer.writeln(repeat("-", width));
  buffer.writeln(repeat("", width));
  buffer.writeln(padBoth("TOTAL", "${formatter.format(total)}", width));
  buffer.writeln(repeat("", width));
  buffer.writeln(repeat("-", width));
  buffer.writeln(repeat("", width));
  buffer.writeln(centerText("Thank You", width));
  buffer.writeln(centerText("Visit Again", width));
  buffer.writeln(repeat("", width));
  buffer.writeln(centerText("Powered by", width));
  buffer.writeln(centerText("Dev-Sherlok", width));

  // Save and download
  final content = buffer.toString();
  final blob = html.Blob([content]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "receipt_${timestamp.millisecondsSinceEpoch}.txt")
    ..click();
  html.Url.revokeObjectUrl(url);
}

String formatItemLine(String name, double price, NumberFormat formatter, int width) {
  final priceStr = "${formatter.format(price)}";
  final availableWidth = width - priceStr.length - 1;

  String trimmedName = name;
  if (trimmedName.length > availableWidth) {
    trimmedName = trimmedName.substring(0, availableWidth - 1) + ".";
  }

  return trimmedName.padRight(availableWidth) + " " + priceStr;
}

String padBoth(String label, String value, int width) {
  final space = width - label.length - value.length - 1;
  return label + " " * (space >= 0 ? space + 1 : 1) + value;
}

String centerText(String text, int width) {
  final pad = ((width - text.length) / 2).floor();
  return " " * pad + text;
}

String repeat(String char, int count) {
  return char.isEmpty ? " " * count : char * count;
}
