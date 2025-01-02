import 'dart:convert';
import 'package:cart_app/module/models/product_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String apiUrl = 'https://dummyjson.com/products';

  static Future<List<Product>> fetchProductList() async {
  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
           final Map<String, dynamic> data = json.decode(response.body);
      // Assuming the products are in the "products" key
     final List<dynamic> productsList = data['products'];
      return productsList.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching products: $error');
    throw Exception('Failed to load products');
  }
}

}
