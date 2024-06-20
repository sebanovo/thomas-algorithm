import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_config.dart';

Widget descriptionTab() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: paddingX),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/image-tab-two.png'),
        ),
        Text(
          "Sistemas de ecuaciones lineales tridiagonales",
          style:
              TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
        ),
        Text(
          "La mayoria de los coefientes son cero, excepto los de la diagonal principal y las dos diagonlaes adyacentes",
          style: TextStyle(fontSize: fontSizeText),
        )
      ],
    ),
  );
}
