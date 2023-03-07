import 'package:flutter/material.dart';
import 'package:login_q2g/Screens/PaymentMethod/body.dart';
import 'package:login_q2g/Screens/PaymentMethod/pedidos_detalles.dart';
import 'package:provider/provider.dart';
import '../../components/constants.dart';
import '../../providers/venta_provider.dart';

class Pedidos extends StatelessWidget {
  const Pedidos({super.key});

  @override
  Widget build(BuildContext context) {
    // final usersProvider = context.read<UsersProvider>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
          shape: const Border(bottom: BorderSide.none),
          title: const Text(
            'Detalles del pedido',
            style: TextStyle(
                color: kWhiteColor, fontFamily: 'Roboto', fontSize: 17),
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
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: kWhiteColor,
            ),
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Consumer<Pedidosprovider>(
              builder: (context, pedidosProvider, child) =>
                  pedidosProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.builder(
                            itemCount: pedidosProvider.pedidos?.length,
                            itemBuilder: (context, index) {
                              final pedido = pedidosProvider.pedidos![index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 10),
                                child: Card(
                                  color: kPrimaryLightColor,
                                  child: ListTile(
                                    splashColor: Colors.red,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UserDetailsScreen(pedido: pedido),
                                        ),
                                      );
                                    },
                                    title: Text('${pedido.nombre}'),
                                    subtitle: Text('${pedido.apellidos}'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ]),
        ]));
  }
}
