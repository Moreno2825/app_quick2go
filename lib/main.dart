import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/categories_provider.dart';
import 'package:test1/providers/products_provider.dart';
import 'package:test1/providers/products_service.dart';
import 'package:test1/providers/shopping_cart_provider.dart';
import 'package:test1/providers/user_providers.dart';
import 'package:test1/screens/Welcome/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider()..fetchProducts(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider()..fetchCategories(),
        ),
        ChangeNotifierProvider(create: (context) => UsersProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductService())
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: Scaffold(
          body: WelcomeScreen(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
