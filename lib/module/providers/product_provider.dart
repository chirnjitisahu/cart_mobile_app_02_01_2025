import 'package:cart_app/module/models/product_model.dart';
import 'package:cart_app/module/services/api_services/api.dart';
import 'package:flutter/material.dart';


class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await ApiService.fetchProductList();
    notifyListeners();
  }
}
