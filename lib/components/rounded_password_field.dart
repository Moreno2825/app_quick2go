import 'package:flutter/material.dart';
import 'package:login_q2g/components/text_field_container.dart';
import 'package:login_q2g/components/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true, // => para no visualizar la contraseña
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: "Contraseña",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: Icon(
          // => para poner el boton de visibilidad de contraseña
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
