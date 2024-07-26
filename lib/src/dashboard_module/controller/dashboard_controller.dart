// Service to fetch products
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_smit_task/model/product_model.dart';
import 'package:tezda_smit_task/src/dashboard_module/dashboard_screen.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

final productProvider = FutureProvider<List<Product>>((ref) async {
  final productService = ProductService();
  return productService.fetchProducts();
});
