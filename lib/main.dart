import 'package:flutter/material.dart';
import 'package:login_q2g/components/constants.dart';
import 'package:login_q2g/Screens/PaymentMethod/body.dart';
import 'package:login_q2g/providers/venta_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/Welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => VentasProvider()..fetchVentas()),
        ChangeNotifierProvider(
            create: (context) => Pedidosprovider()..fetchPedido())
      ],
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: PagoConfirmacionTabBar(),
      ),
    );
  }
}
