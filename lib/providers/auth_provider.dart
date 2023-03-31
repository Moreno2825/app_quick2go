import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  late String _token;

  String get token => _token;

  setToken(String token) {
    _token = token;
    notifyListeners();
  }
}
