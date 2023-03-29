import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/Pages/login_page.dart';
import 'package:test1/dtos/requests/user_create_request.dart';
import 'package:test1/dtos/requests/user_login_request.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  final logger = Logger();

  String? _userEmail;

  Future loginUser(String email, String password, BuildContext context) async {
    final userlogin = UserLoginRequestDto(email: email, password: password);
    final response = await http.post(
      Uri.parse('http://www.quick2goapiprod.somee.com/api/cuentas/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userlogin),
    );

    if (response.statusCode == 200) {
      logger.d('User created: ${response.body}');
      _userEmail = email;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Se inicio correctamente!')));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } else {
      logger.e('Error: {El correo o contraseña es incorrecta}');
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("El correo o contraseña es incorrecta"),
              actions: [
                TextButton(
                  child: const Text("Cerrar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future createUser(String name, String lastname, String email, String password,
      BuildContext context) async {
    final user = UserCreateRequestDto(
        name: name, lastname: lastname, email: email, password: password);
    final response = await http.post(
      Uri.parse('http://www.quick2goapiprod.somee.com/api/cuentas/registrar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      logger.d('User created: ${response.body}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User created!')),
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      logger.e('Error: ${response.statusCode}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}!')),
        );
      }
    }
  }

  String? get UserEmail => _userEmail;

  void logoutUser() {
    _userEmail = null;
    notifyListeners();
  }
}
