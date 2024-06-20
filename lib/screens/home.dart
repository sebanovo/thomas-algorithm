import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

const double widthTextField = 70.0;

class _HomeState extends State<Home> {
  final List<String> items = ['3x3', '4x4', '5x5', '6x6'];
  String? selectedItem;
  late int numberOfFields;
  List<TextEditingController> cnControllers = [];
  List<TextEditingController> bnControllers = [];
  List<TextEditingController> anControllers = [];
  List<TextEditingController> dnControllers = [];

  List<double> xResults = [];

  @override
  void initState() {
    super.initState();
    numberOfFields = int.parse(items[0][0]);
    _initializeControllers(numberOfFields);
  }

  void _initializeControllers(int count) {
    cnControllers = List.generate(count, (index) => TextEditingController());
    bnControllers = List.generate(count, (index) => TextEditingController());
    anControllers = List.generate(count, (index) => TextEditingController());
    dnControllers = List.generate(count, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in cnControllers) {
      controller.dispose();
    }
    for (var controller in bnControllers) {
      controller.dispose();
    }
    for (var controller in anControllers) {
      controller.dispose();
    }
    for (var controller in dnControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _calculateResults() {
    setState(() {
      List<double> cn = cnControllers
          .map((controller) => double.tryParse(controller.text) ?? 0)
          .toList();
      List<double> bn = bnControllers
          .map((controller) => double.tryParse(controller.text) ?? 0)
          .toList();
      List<double> an = anControllers
          .map((controller) => double.tryParse(controller.text) ?? 0)
          .toList();
      List<double> dn = dnControllers
          .map((controller) => double.tryParse(controller.text) ?? 0)
          .toList();

      if (cn.isNotEmpty) {
        cn.removeAt(0); // Eliminar el primer elemento de la lista cn
      }

      if (an.isNotEmpty) {
        an.removeLast(); // Eliminar el último elemento de la lista an
      }

      xResults = thomas(size: numberOfFields, cn: cn, bn: bn, an: an, b: dn);
    });
  }

  List<double> thomas({
    required int size,
    required List<double> cn,
    required List<double> bn,
    required List<double> an,
    required List<double> b,
  }) {
    List<List<double>> L = List.generate(size, (i) => List.filled(size, 0));
    List<List<double>> U = List.generate(size, (i) => List.filled(size, 0));

    // Crear la matriz L
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        L[i][j] = (i == j) ? 1 : 0;
        U[i][j] = 0;
      }
    }

    U[0][0] = bn[0];
    for (int i = 1; i < size; i++) {
      U[i - 1][i] = cn[i - 1];
    }

    for (int i = 2; i <= size; i++) {
      an[i - 2] = an[i - 2] / bn[i - 2];
      L[i - 1][i - 2] = an[i - 2];
      bn[i - 1] = bn[i - 1] - an[i - 2] * cn[i - 2];
      U[i - 1][i - 1] = bn[i - 1];
    }

    // Resolver L * D = B
    List<double> d = List.filled(size, 0);
    d[0] = b[0];
    for (int i = 1; i < size; i++) {
      d[i] = b[i] - (L[i][i - 1]) * d[i - 1];
    }

    // Resolver U * X = D
    List<double> x = List.filled(size, 0);
    x[size - 1] = d[size - 1] / U[size - 1][size - 1];
    for (int i = size - 2; i >= 0; i--) {
      x[i] = (d[i] - U[i][i + 1] * x[i + 1]) / U[i][i];
    }
    return x;
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
                  if (selectedItem != null && selectedItem!.isNotEmpty) {
                    int firstCharacter = int.tryParse(selectedItem![0]) ?? 0;
                    numberOfFields = firstCharacter;
                    _initializeControllers(numberOfFields);
                  } else {
                    numberOfFields = 0;
                    _initializeControllers(numberOfFields);
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
                    controller: cnControllers[index],
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
                    controller: bnControllers[index],
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: '${index + 1}',
                    ),
                  ),
                );
              }),
            ),
            const Text(
              "Diagonal inferior (an)",
              style: TextStyle(fontSize: fontSizeText),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(numberOfFields, (index) {
                return SizedBox(
                  width: widthTextField,
                  child: TextField(
                    controller: anControllers[index],
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: '${index + 1}',
                    ),
                  ),
                );
              }),
            ),
            const Text(
              "Términos independientes (dn)",
              style: TextStyle(fontSize: fontSizeText),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(numberOfFields, (index) {
                return SizedBox(
                  width: widthTextField,
                  child: TextField(
                    controller: dnControllers[index],
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: '${index + 1}',
                    ),
                  ),
                );
              }),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: _calculateResults,
              child: const Text(
                'Calcular!!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(xResults.length, (index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.black,
                child: Text(
                  'Resultado X${index + 1}: ${xResults[index]}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
