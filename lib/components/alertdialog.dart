import 'package:flutter/material.dart';
import 'package:login_q2g/Screens/Login/login_screen.dart';
import 'package:login_q2g/components/constants.dart';

class AlertDialogConfirmation extends StatelessWidget {
  const AlertDialogConfirmation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      title: const Column(
        children: [
          Icon(
            Icons.monetization_on_outlined,
            color: kPrimaryColor,
            size: 60,
          ),
          Text(
            'Compra exitosa',
            style: TextStyle(
                color: kValueBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.w400),
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
      content: const Text(
        'Tu compra ha sido confirmada, gracias por elegirnos',
        style: TextStyle(color: kValueColor, fontSize: 14),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Ok',
            style: TextStyle(color: kPrimaryColor),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            })); // Lógica del botón Aceptar
          },
        ),
      ],
    );
  }
}
