import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts({
    required int limit,
    required int page,
    String? sortOption,
    String? category,
    String? priceRange,
    String? rating,
  }) async {
    final uri = Uri.parse(baseUrl).replace(queryParameters: {
      'limit': limit.toString(),
      'page': page.toString(),
      if (sortOption != null) 'sort': sortOption,
      if (category != null) 'category': category,
      if (priceRange != null) 'priceRange': priceRange,
      if (rating != null) 'rating': rating,
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  fetchProductsByQuery(String query) {}
}
