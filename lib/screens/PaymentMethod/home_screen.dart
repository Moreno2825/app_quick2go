import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/screens/PaymentMethod/body.dart';
import '../../components/constants.dart';
import '../../providers/venta_provider.dart';

class VentaScreen extends StatefulWidget {
  const VentaScreen({Key? key});

  @override
  State<VentaScreen> createState() => _VentaScreenState();
}

class _VentaScreenState extends State<VentaScreen> {
  @override
  void initState() {
    Provider.of<VentasProvider>(context, listen: false).fetchVentas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        shape: const Border(bottom: BorderSide.none),
        title: const Text(
          'Detalles de la compra',
          style:
              TextStyle(color: kWhiteColor, fontFamily: 'Roboto', fontSize: 17),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: kWhiteColor,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: kWhiteColor,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PagoConfirmacionTabBar()));
          },
          icon: const Icon(
            Icons.close,
            color: kWhiteColor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<VentasProvider>(
            builder: (context, ventasProvider, child) => ventasProvider
                    .isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: ventasProvider.ventas?.length,
                      itemBuilder: (context, index) {
                        final venta = ventasProvider.ventas![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Card(
                            color: kPrimaryLightColor,
                            child: ListTile(
                              splashColor: Colors.red,
                              onTap: () {},
                              title: Text(
                                'Nota de venta: ${venta.id}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Producto: ${venta.pedido.producto.nombreProducto}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                      'Cantidad de producto: ${venta.pedido.cantidadProducto}',
                                      style: const TextStyle(fontSize: 16)),
                                  Text('Subtotal: ${venta.pedido.subTotal}',
                                      style: const TextStyle(fontSize: 16)),
                                  Text(
                                    'Total de pago: ${venta.totalPago.toStringAsFixed(2)}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)),
            onPressed: () {
              // Acción a realizar al presionar el botón
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Compra realizada'),
                    content:
                        const Text('Tu compra ha sido realizada exitosamente.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'ACEPTAR',
                          selectionColor: kValueColor,
                        ),
                        onPressed: () {
                          // Acción a realizar al presionar el botón de aceptar en la alerta
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}
