import 'package:flutter/material.dart';
import 'package:thomas_algorithm/constants/text_config.dart';

Widget membersTab() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: paddingX),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/image-tab-three.png'),
        ),
        Text(
          'Integrantes',
          style:
              TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
        ),
        Text(
          'Sebastian Cespedes Rodas',
          style: TextStyle(fontSize: fontSizeText),
        ),
        Text(
          'Lucas Flores Gonzales',
          style: TextStyle(fontSize: fontSizeText),
        ),
        Text(
          'Diego Banegas Suarez',
          style: TextStyle(fontSize: fontSizeText),
        ),
        Text(
          'Mario Guardia Montero',
          style: TextStyle(fontSize: fontSizeText),
        ),
        Text(
          'Clider Eusebio Derbez',
          style: TextStyle(fontSize: fontSizeText),
        ),
      ],
    ),
  );
}
