import 'menu_item.dart';

class Receipt {
  final DateTime timestamp;
  final List<MenuItem> items;

  Receipt({
    required this.timestamp,
    required this.items,
  });

  double get total => items.fold(0, (sum, item) => sum + item.price);

  Map<String, dynamic> toJson() => {
  'timestamp': timestamp.toIso8601String(),
  'items': items.map((e) => e.toJson()).toList(),
};

factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
  timestamp: DateTime.parse(json['timestamp']),
  items: (json['items'] as List).map((e) => MenuItem.fromJson(e)).toList(),
);

}
