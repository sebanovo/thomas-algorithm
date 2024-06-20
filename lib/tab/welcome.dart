import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_config.dart';

Widget welcomeTab() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: paddingX),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/image-tab-one.png'),
        ),
        Text(
          "Metodo de thomas",
          style:
              TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
        ),
        Text(
          "El metodo eficiente para resolver sistemas de ecuaciones tridiagonales",
          style: TextStyle(fontSize: fontSizeText),
        )
      ],
    ),
  );
}
