import 'package:flutter/material.dart';
import 'package:login_q2g/components/text_field_container.dart';

class RoundedinputFieldRegister extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedinputFieldRegister(
      {super.key, required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
