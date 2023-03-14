import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test1/dtos/responses/categories_response_dto.dart';
import 'package:http/http.dart' as http;

class CategoriesProvider extends ChangeNotifier {
  final logger = Logger();

  List<CategoryResponseDto>? _categories;

  bool isLoading = true;

  List<CategoryResponseDto>? get categories => _categories;

  Future fetchCategories() async {
    final response = await http.get(
        Uri.parse('http://www.quick2goapiprod.somee.com/api/categorias'),
        headers: <String, String>{'content-type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      
      final List<dynamic> data = json;
      //logger.
      _categories = data.map((category) => CategoryResponseDto.fromJson(category)).toList();
      logger.d(json);
      isLoading = false;

      notifyListeners();
    } else{
      throw Exception('Failed to load product');
    }
  }
}
