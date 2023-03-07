import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import '../../components/button.dart';
import '../../components/constants.dart';
import '../../components/input_confirmation.dart';
import 'home_screen.dart';

class PaypalConfirmation extends StatelessWidget {
  const PaypalConfirmation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, bottom: 5, top: 10),
          child: Text(
            'Detalles de la compra',
            style: TextStyle(
                fontSize: 15, color: kValueColor, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kPrimaryLightColor),
            width: double.infinity, // ancho máximo
            height: 100,
            child: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                '\n No. de orden:\n Información:\n Total:\n',
                style: TextStyle(
                  color: kValueColor,
                ),
              ),
            ), // altura fija
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15, bottom: 5, top: 10),
          child: Text(
            'Coloca tu dirección',
            style: TextStyle(
                fontSize: 15, color: kValueColor, fontWeight: FontWeight.bold),
          ),
        ),
        const InputConfirmation(helperText: 'Dirección'),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Button(
            text: 'CONTINUAR',
            press: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
      ],
    );
  }
}
