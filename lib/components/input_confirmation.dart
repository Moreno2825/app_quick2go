import 'package:flutter/material.dart';
import 'package:login_q2g/components/constants.dart';

class InputConfirmation extends StatelessWidget {
  final String helperText;
  const InputConfirmation({
    super.key,
    required this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 10, left: 20, right: 20),
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: kPrimaryLightColor,
          helperText: helperText,
          helperStyle: const TextStyle(color: kValueColor, fontSize: 13),
          hintStyle: const TextStyle(color: kValueColor, fontSize: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
