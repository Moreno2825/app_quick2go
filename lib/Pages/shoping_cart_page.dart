import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/help_page.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/providers/pedidos_provide.dart';
import 'package:test1/screens/PaymentMethod/body.dart';
import 'package:test1/widgets/icons.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    // Llama a fetchPedidos cuando la pantalla es cargada
    Provider.of<PedidoProvider>(context, listen: false).fetchPedidos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compra'),
        backgroundColor: kPrimaryColor,
      ),
      body: Consumer<PedidoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.pedidos.length,
                  itemBuilder: (context, index) {
                    final pedido = provider.pedidos[index];
                    return ListTile(
                      leading: Image.network(pedido.producto.foto),
                      title: Text(pedido.producto.nombreProducto),
                      subtitle: Text(
                          '${pedido.cantidadProducto} x \$${pedido.subTotal}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title:
                                  const Text('¿Eliminar producto del carrito?'),
                              content: const Text(
                                  '¿Está seguro de que desea eliminar este pedido?'),
                              actions: [
                                TextButton(
                                  child: const Text('Cancelar'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                  child: const Text('Eliminar'),
                                  onPressed: () async {
                                    await provider.eliminarPedido(pedido.id);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Pedido eliminado'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '\$${provider.getTotal()?.toStringAsFixed(2) ?? '0.00'}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed:
                        provider.getTotal() != null && provider.getTotal() > 0
                            ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PagoConfirmacionTabBar()));
                              }
                            : null,
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
                    child: const Text('PAGAR'),
                  ),
                ],
              ),
            ],
          );
        },
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
                            builder: (context) => const CartScreen(),
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
