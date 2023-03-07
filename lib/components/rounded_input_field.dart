import 'package:flutter/material.dart';
import 'package:login_q2g/components/text_field_container.dart';
import 'package:login_q2g/components/constants.dart';

class RoundedinputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedinputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none, // => quita la linea de form
        ),
      ), // => para hacer ovalado el form
    );
  }
}
