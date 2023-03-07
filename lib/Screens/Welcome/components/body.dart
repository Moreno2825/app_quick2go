import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_q2g/Screens/Login/login_screen.dart';
import 'package:login_q2g/Screens/Welcome/components/background.dart';
import 'package:login_q2g/components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.3),
          SvgPicture.asset(
            "assets/icons/quick2go.svg",
            height: size.height * 0.28,
          ),
          SizedBox(height: size.height * 0.02),
          const Text(
            "¡Aqui encuentras el mejor servicio!",
            style: TextStyle(fontFamily: 'PaytoneOne'),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
            text: "ENTRAR",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
