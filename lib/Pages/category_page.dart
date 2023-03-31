import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/categories_page.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/Pages/search_screen.dart';
import 'package:test1/Pages/shoping_cart_page.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/providers/pedidos_provide.dart';
import 'package:test1/providers/products_provider.dart';
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
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
                                    height: 180,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        product.nombreProducto,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Roboto',
                                            color: kValueColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product.descripcion,
                                        style: const TextStyle(
                                            fontSize: 18,
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
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            color: kValueColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              int cantidad =
                                                  1; // Cantidad de productos seleccionados
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                title: const Text(
                                                    'Agregar al carrito'),
                                                content: TextFormField(
                                                  initialValue: '1',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onChanged: (value) {
                                                    cantidad =
                                                        int.tryParse(value) ??
                                                            1;
                                                  },
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Ingrese una cantidad válida';
                                                    }
                                                    final parsedValue =
                                                        int.tryParse(value);
                                                    if (parsedValue == null ||
                                                        parsedValue <= 0) {
                                                      return 'Ingrese una cantidad válida';
                                                    }
                                                    return null;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Cantidad',
                                                    hintText:
                                                        'Ingrese la cantidad de productos que desea agregar',
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: const Text(
                                                      'Cancelar',
                                                      style: TextStyle(
                                                          color: kPrimaryColor),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    kPrimaryColor)),
                                                    onPressed: () {
                                                      final pedidoProvider =
                                                          Provider.of<
                                                                  PedidoProvider>(
                                                              context,
                                                              listen: false);
                                                      pedidoProvider.addPedido(
                                                        product.id,
                                                        cantidad,
                                                      );
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Producto agregado al carrito'),
                                                          duration: Duration(
                                                              seconds: 2),
                                                        ),
                                                      );
                                                    },
                                                    child:
                                                        const Text('ACEPTAR'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  kPrimaryColor),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.shopping_cart),
                                            SizedBox(width: 8),
                                            Text('AGREGAR')
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
                                _selectedIndex = 1;
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CategoriesPage(),
                                  ),
                                );
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
                                    builder: (context) => const CartScreen(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
