import 'package:flutter/material.dart';
import 'package:thomas_algorithm/func/thomas.dart';
import 'package:thomas_algorithm/components/number_input_row.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<int> items = List.generate(10, (index) => index + 3);
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
    numberOfFields = items[0];
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

        List<double>? results = Thomas.method(an, bn, cn, dn);

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
        backgroundColor: const Color(0xFF111827),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Image(image: AssetImage('assets/image-tab-two.png')),
            DropdownButton<int>(
              value: selectedItem != null
                  ? int.parse(selectedItem!.split('x')[0])
                  : items[0],
              onChanged: (int? newValue) {
                setState(() {
                  selectedItem = '$newValue x $newValue';
                  numberOfFields = newValue!;
                  _initializeControllers(numberOfFields);
                });
              },
              items: items.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value x $value'),
                );
              }).toList(),
            ),
            NumberInputRow(
              title: "Diagonal superior (cn)",
              numberOfFields: numberOfFields - 1,
              controllers: cnControllers,
            ),
            NumberInputRow(
              title: "Diagonal principal (bn)",
              numberOfFields: numberOfFields,
              controllers: bnControllers,
            ),
            NumberInputRow(
              title: "Diagonal inferior (an)",
              numberOfFields: numberOfFields - 1,
              controllers: anControllers,
            ),
            NumberInputRow(
              title: "Términos independientes (dn)",
              numberOfFields: numberOfFields,
              controllers: dnControllers,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827)),
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
                color: const Color(0xFF111827),
                child: Text(
                  'Resultado x${index + 1} =  ${xResults[index]}',
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
