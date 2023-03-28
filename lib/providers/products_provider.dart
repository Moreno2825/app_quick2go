import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test1/dtos/responses/product_response_dto.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  final logger = Logger();

  List<ProductResponseDto>? _products;

  bool isLoading = true;

  List<ProductResponseDto>? get products => _products;

  Future fetchProducts() async {
    final response = await http.get(
        Uri.parse('http://www.quick2goapiprod.somee.com/api/productos'),
        headers: <String, String>{'content-type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      //print(json);
      final List<dynamic> data = json;
      logger.d(json);
      _products =
          data.map((product) => ProductResponseDto.fromJson(product)).toList();

      isLoading = false;

      notifyListeners();
    } else {
      throw Exception('Failed to load product');
    }
  }

  List<ProductResponseDto>? _productsCitrus;
  List<ProductResponseDto>? get productsCitrus => _productsCitrus;

  Future fetchProductCitrus() async {
    final response = await http.get(
        Uri.parse(
            'http://www.quick2goapiprod.somee.com/api/productos/Categoria?Categoria=Bebidas%20c%C3%ADtricas'),
        headers: <String, String>{'content-type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;
      logger.d(json);
      _productsCitrus =
          data.map((product) => ProductResponseDto.fromJson(product)).toList();

      isLoading = false;

      notifyListeners();
    } else {
      throw Exception('Failed to load product');
    }
  }

  List<ProductResponseDto>? _productsTropical;
  List<ProductResponseDto>? get productsTropical => _productsTropical;
  Future fetchProductTropical() async {
    final response = await http.get(
        Uri.parse(
            'http://www.quick2goapiprod.somee.com/api/productos/Categoria?Categoria=Bebidas%20tropicales'),
        headers: <String, String>{'content-type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;
      logger.d(json);
      _productsTropical =
          data.map((product) => ProductResponseDto.fromJson(product)).toList();

      isLoading = false;

      notifyListeners();
    } else {
      throw Exception('Failed to load product');
    }
  }
}
