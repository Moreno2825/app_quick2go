import 'package:flutter/material.dart';
import 'package:test1/dtos/responses/product_response_dto.dart';

class CartProvider with ChangeNotifier {
  final List<ProductResponseDto> _cartItems = [];

  List<ProductResponseDto> get cartItems => _cartItems;

  void addToCart(ProductResponseDto product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductResponseDto product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice => _cartItems.fold(
        0,
        (previousValue, element) => previousValue + element.precio,
      );
}
