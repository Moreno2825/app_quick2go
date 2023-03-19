import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/help_page.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/Pages/search_screen.dart';
import 'package:test1/Pages/shoping_cart_page.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/providers/products_provider.dart';
import 'package:test1/providers/shopping_cart_provider.dart';
import 'package:test1/widgets/icons.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productsProvider, child) => productsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductSearchScreen()));
                    },
                  )
                ],
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              body: SizedBox(
                height: 720,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 16,
                  ),
                  itemCount: productsProvider.products?.length,
                  itemBuilder: (context, index) {
                    final product = productsProvider.products![index];
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
                                            color: kValueColor),
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
                                            color: kValueColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final cartProvider =
                                              Provider.of<CartProvider>(context,
                                                  listen: false);
                                          if (cartProvider.cartItems.length <
                                              10) {
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
                                          } else {
                                            Fluttertoast.showToast(
                                              msg:
                                                  'No se pueden agregar más de 10 productos',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.grey[300],
                                              textColor: Colors.black,
                                              fontSize: 16.0,
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: kValueColor),
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
                ),
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
                                    builder: (context) =>
                                        const ShopinCartPage(),
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
            ),
    );
  }
}
