import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> items = ['3x3', '4x4', '5x5', '6x6'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Metodo de Thomas"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Image(image: AssetImage('assets/image-tab-two.png')),
          DropdownButton<String>(
            value: selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue;
              });
            },
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: const Text('3x3'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.map((item) {
              return SizedBox(
                width: 50,
                child: TextField(
                  onChanged: (value) {
                    // Guardar el valor del TextField en la lista correspondiente al índice
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'nose',
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
