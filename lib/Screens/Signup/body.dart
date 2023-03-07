import 'package:flutter/material.dart';
import 'package:login_q2g/Screens/Login/components/background.dart';
import 'package:login_q2g/Screens/Login/login_screen.dart';
import 'package:login_q2g/components/rounded_input_field_register.dart';
import 'package:login_q2g/components/rounded_password_field.dart';
import 'package:login_q2g/components/rounded_password_view.dart';

import '../../components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Quick2Go",
              style: TextStyle(fontFamily: 'PaytoneOne', fontSize: 50),
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              "Ingresa tus datos",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedinputFieldRegister(
                hintText: "Tu nombre", onChanged: (value) {}),
            SizedBox(height: size.height * 0.01),
            RoundedinputFieldRegister(
                hintText: "Apellidos", onChanged: (value) {}),
            SizedBox(height: size.height * 0.01),
            RoundedinputFieldRegister(hintText: "Email", onChanged: (value) {}),
            SizedBox(height: size.height * 0.01),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedPasswordView(onChanged: (value) {}),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Siguiente",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
