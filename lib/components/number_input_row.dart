import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputRow extends StatelessWidget {
  final String title;
  final int numberOfFields;
  final List<TextEditingController> controllers;

  static const String _hintText = '0';
  static const double _fontSize = 16;

  const NumberInputRow({
    Key? key,
    required this.title,
    required this.numberOfFields,
    required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: _fontSize, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(numberOfFields, (index) {
            return Expanded(
              child: TextField(
                controller: controllers[index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: _hintText,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*$')),
                ],
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }),
        ),
      ],
    );
  }
}
