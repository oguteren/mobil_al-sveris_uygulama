import 'dart:convert';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      category: map['category'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      price: (map['price'] as num).toDouble(),
    );
  }

  static List<Product> listFromJson(String source) {
    final decoded = jsonDecode(source) as List<dynamic>;
    return decoded
        .map((item) => Product.fromMap(item as Map<String, dynamic>))
        .toList();
  }
}
