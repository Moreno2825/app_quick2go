import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/categories_page.dart';
import 'package:test1/Pages/help_page.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/providers/shopping_cart_provider.dart';
import 'package:test1/widgets/icons.dart';

class ShopinCartPage extends StatefulWidget {
  const ShopinCartPage({super.key});

  @override
  State<ShopinCartPage> createState() => _ShopinCartPageState();
}

class _ShopinCartPageState extends State<ShopinCartPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return ListTile(
                  title: Text(product.nombreProducto),
                  subtitle: Text(product.descripcion),
                  leading: Image.network(product.foto),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Total: \$${cartProvider.totalPrice}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            child: const Text('Pagar'),
            onPressed: () {},
          ),
          const SizedBox(height: 20),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      },
                    );
                    //Ver como hacer el ruteo
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CategoriesPage(),
                        ));
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
