class MenuItem {
  final String name;
  final String category;
  final double price;

  MenuItem({
    required this.name,
    required this.category,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'price': price,
      };

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        name: json['name'],
        category: json['category'],
        price: (json['price'] as num).toDouble(),
      );
}
