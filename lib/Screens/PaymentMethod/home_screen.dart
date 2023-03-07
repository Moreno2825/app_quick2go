import 'package:flutter/material.dart';
import 'package:login_q2g/Screens/PaymentMethod/body.dart';
import 'package:login_q2g/Screens/PaymentMethod/cash_confirmation.dart';
import 'package:login_q2g/Screens/PaymentMethod/pedidos_list.dart';
import 'package:login_q2g/components/button.dart';
import 'package:provider/provider.dart';
import '../../components/constants.dart';
import '../../providers/venta_provider.dart';
import 'pedidos_detalles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final usersProvider = context.read<UsersProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        shape: const Border(bottom: BorderSide.none),
        title: const Text(
          'Método de pago',
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
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            color: kWhiteColor,
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<VentasProvider>(
          builder: (context, ventasProvider, child) => ventasProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: ventasProvider.ventas?.length,
                    itemBuilder: (context, index) {
                      final venta = ventasProvider.ventas![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 10),
                        child: Card(
                          color: kPrimaryLightColor,
                          child: ListTile(
                            splashColor: Colors.red,
                            onTap: () {},
                            title: Text(venta.direccion),
                            subtitle: Text('${venta.totalPago}'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
        Button(
            text: 'Continuar',
            press: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Pedidos()));
            })
      ]),
    );
  }
}
