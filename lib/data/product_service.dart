import 'package:flutter/services.dart';

import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    return Product.listFromJson(jsonString);
  }
}
