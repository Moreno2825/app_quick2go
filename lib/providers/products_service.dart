import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:test1/dtos/responses/product_response_dto.dart';

class ProductService with ChangeNotifier {
  final logger = Logger();

  bool isLoading = true;
  List<ProductResponseDto> _products = [];

  List<ProductResponseDto> get products => _products;

  Future<void> getProductByName(String name) async {
    final response = await http.get(
        Uri.parse(
            'http://www.quick2goapiprod.somee.com/api/productos/nombreProducto?nombre=$name'),
        headers: <String, String>{'content-type': 'application/json'});

    if (response.statusCode == 200) {
      if (response.body != null && response.body.isNotEmpty) {
        final json = jsonDecode(response.body);
        final List<dynamic> data = json;
        logger.d(json);
        _products = data
            .map((product) => ProductResponseDto.fromJson(product))
            .toList();

        isLoading = false;

        notifyListeners();
      }
    } else {
      throw Exception('No se encontro el producto');
    }
  }
}
