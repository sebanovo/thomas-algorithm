import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_config.dart';
import 'package:flutter_application_1/func/thomas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

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
    cnControllers =
        List.generate(count - 1, (index) => TextEditingController());
    bnControllers = List.generate(count, (index) => TextEditingController());
    anControllers =
        List.generate(count - 1, (index) => TextEditingController());
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

  void _calculateResults(BuildContext context) {
    try {
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

        Thomas thomas = Thomas();
        List<double>? results = thomas.method(an, bn, cn, dn);

        if (results != null) {
          xResults = results;
        } else {
          xResults = [];
        }
      });
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método de Thomas'),
        centerTitle: true,
        backgroundColor: const Color(0xFF111827), // Fondo oscuro
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
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
              children: List.generate(numberOfFields - 1, (index) {
                return Expanded(
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
                return Expanded(
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
              children: List.generate(numberOfFields - 1, (index) {
                return Expanded(
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
                return Expanded(
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
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827)), // Fondo oscuro),
              onPressed: () => _calculateResults(context),
              child: const Text(
                'Calcular',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(xResults.length, (index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                color: const Color(0xFF111827), // Fondo oscuro,
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
