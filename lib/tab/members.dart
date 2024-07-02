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
          'Oliver Santos Garnica Valda',
          style: TextStyle(fontSize: fontSizeText),
        ),
        Text(
          'Diego Banegas Suarez',
          style: TextStyle(fontSize: fontSizeText),
        ),
        Text(
          'Juan Clider Servantes Dueñas',
          style: TextStyle(fontSize: fontSizeText),
        ),
      ],
    ),
  );
}
