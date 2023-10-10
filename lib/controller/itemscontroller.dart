import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as response;
import '../api/helpers.dart';
import '../const/endpoint.dart';
import '../models/products.dart';

class CarController extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<Product> products = [];

  List<CartItem> get items => _items;

  double get total => _items.fold(
      0,
      (total, item) =>
          total + (double.parse(item.product.price.amount) * item.quantity));

  void addToCart(Product product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product, quantity: 1));
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      print("object");
      Object listOfProducts = await ApiBaseHelper().getHTTP(getting);
      response.Response expensesAsResponse =
          listOfProducts as response.Response;
      final items =
          expensesAsResponse.data['data'].cast<Map<String, dynamic>>();

      products = items.map<Product>((json) {
        return Product.fromJson(json);
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
