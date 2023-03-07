import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_q2g/Screens/Login/components/background.dart';
import 'package:login_q2g/Screens/Signup/signup_screen.dart';
import 'package:login_q2g/components/already_hae_an_account.dart';
import 'package:login_q2g/components/rounded_button.dart';
import 'package:login_q2g/components/rounded_input_field.dart';

import '../../../components/rounded_password_field.dart';
import '../../PaymentMethod/body.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Bienvenido a",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            const Text(
              "Quick2Go",
              style: TextStyle(fontFamily: 'PaytoneOne', fontSize: 50),
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              "Ingresa a tu cuenta",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 15),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedinputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "ENTRAR",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PagoConfirmacionTabBar();
                }));
              },
            ),
            AlreadyHaveAnAccountCheck(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
