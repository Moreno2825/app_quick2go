import 'package:flutter/material.dart';
import 'package:login_q2g/components/text_field_container.dart';
import 'package:login_q2g/components/constants.dart';

class RoundedPasswordView extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordView({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Confirmar Contraseña",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
