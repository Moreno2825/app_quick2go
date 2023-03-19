import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/help_page.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/Pages/shoping_cart_page.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/providers/products_service.dart';
import 'package:test1/providers/shopping_cart_provider.dart';
import 'package:test1/widgets/icons.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Buscador'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Ingresa el nombre del producto',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) async {
                try {
                  await Provider.of<ProductService>(context, listen: false)
                      .getProductByName(value);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: Consumer<ProductService>(
              builder: (context, productService, child) {
                if (productService.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (productService.products.isEmpty) {
                  return const Center(child: Text('No products found'));
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 16,
                    ),
                    itemCount: productService.products.length,
                    itemBuilder: (context, index) {
                      final product = productService.products[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Agrega el producto al carrito
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Expanded(
                                    flex: 2,
                                    child: Image.network(
                                      product.foto,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          product.descripcion,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            color: kValueColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          'Precio: \$${product.precio.toString()}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Roboto',
                                            color: kValueColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            final cartProvider =
                                                Provider.of<CartProvider>(
                                                    context,
                                                    listen: false);
                                            cartProvider.addToCart(product);
                                            Fluttertoast.showToast(
                                              msg:
                                                  '¡${product.nombreProducto} se agregó al carrito!',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.grey[300],
                                              textColor: Colors.black,
                                              fontSize: 16.0,
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: kValueColor,
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text('Agregar'),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(
                      () {
                        //_selectedIndex = 0;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
                IconBottomBar(
                  text: "Categories",
                  icon: Icons.sell,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(
                      () {
                        //_selectedIndex = 1;
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const CategoriesPage(),
                        //   ),
                        // );
                      },
                    );
                  },
                ),
                IconBottomBar(
                  text: "Carrito",
                  icon: Icons.shopping_cart,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(
                      () {
                        _selectedIndex = 2;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ShopinCartPage(),
                          ),
                        );
                      },
                    );
                  },
                ),
                IconBottomBar(
                  text: "Help",
                  icon: Icons.help_outlined,
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    setState(
                      () {
                        //_selectedIndex = 3;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HelpPage()));
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
