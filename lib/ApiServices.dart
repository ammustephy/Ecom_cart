import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ocius_cart/Model/PoductModels.dart';

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  /// Fetch all products from the API
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/products'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  /// Fetch a single product by ID
  Future<Product> fetchProduct(int productId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/products/$productId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Product.fromJson(json);
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }
}