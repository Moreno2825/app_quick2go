import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Más productos",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Ver más",
              style: TextStyle(
                  color: Color(0xff15BE77), fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
