import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

const double widthTextField = 50.0;

class _HomeState extends State<Home> {
  final List<String> items = ['3x3', '4x4', '5x5', '6x6'];
  String? selectedItem;
  late int numberOfFields; // Declaración tardía de numberOfFields

  @override
  void initState() {
    super.initState();
    numberOfFields = int.parse(items[0].substring(0, 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Metodo de Thomas"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Image(image: AssetImage('assets/image-tab-two.png')),
              DropdownButton<String>(
                value: selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue;
                    // Determinar el número de campos de texto basado en el primer carácter seleccionado
                    if (selectedItem != null && selectedItem!.isNotEmpty) {
                      int firstCharacter = int.tryParse(selectedItem![0]) ?? 0;
                      numberOfFields = firstCharacter;
                    } else {
                      numberOfFields =
                          0; // Por defecto, mostrar ningún campo de texto si no hay selección válida
                    }
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
              const Text(
                "Diagonal superior (cn)",
                style: TextStyle(fontSize: fontSizeText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(numberOfFields, (index) {
                  return SizedBox(
                    width: widthTextField,
                    child: TextField(
                      onChanged: (value) {
                        // Acción cuando cambia el texto
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '${index + 1}',
                      ),
                    ),
                  );
                }),
              ),
              const Text(
                "Diagonal principal (bn)",
                style: TextStyle(fontSize: fontSizeText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(numberOfFields, (index) {
                  return SizedBox(
                    width: widthTextField,
                    child: TextField(
                      onChanged: (value) {
                        // Acción cuando cambia el texto
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '${index + 1}',
                      ),
                    ),
                  );
                }),
              ),
              const Text(
                "Diagonal inferiro (an)",
                style: TextStyle(fontSize: fontSizeText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(numberOfFields, (index) {
                  return SizedBox(
                    width: widthTextField,
                    child: TextField(
                      onChanged: (value) {
                        // Acción cuando cambia el texto
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '${index + 1}',
                      ),
                    ),
                  );
                }),
              ),
              const Text(
                "terminos independientes (dn)",
                style: TextStyle(fontSize: fontSizeText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(numberOfFields, (index) {
                  return SizedBox(
                    width: widthTextField,
                    child: TextField(
                      onChanged: (value) {
                        // Acción cuando cambia el texto
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '${index + 1}',
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
