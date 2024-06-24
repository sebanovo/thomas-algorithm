import 'package:flutter/material.dart';
import 'package:thomas_algorithm/screens/home.dart';
import 'package:thomas_algorithm/tab/index.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

List<Widget> tabs = [welcomeTab(), descriptionTab(), membersTab()];

class _IntroductionState extends State<Introduction>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: tabs.length, initialIndex: _currentIndex, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TabBarView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: tabs,
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: TabPageSelector(
                color:
                    Colors.white, // Color del indicador de página seleccionada
                indicatorSize: 10.0, // Tamaño del indicador
                controller: controller,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = _currentIndex + 1;
            if (_currentIndex < tabs.length) {
              controller.animateTo(_currentIndex);
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home()),
              );
            }
          });
        },
        backgroundColor:
            Color(0xFF111827), // Fondo oscuro para el botón flotante
        hoverElevation: 0,
        elevation: 0,
        child: const Icon(Icons.navigate_next,
            color: Colors.white), // Icono blanco
      ),
    );
  }
}
