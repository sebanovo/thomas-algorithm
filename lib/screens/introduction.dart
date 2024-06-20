import 'package:flutter/material.dart';
import 'package:flutter_application_1/tab/index.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

List<Widget> widgets = [welcomeTab(), descriptionTab(), membersTab()];

class _IntroductionState extends State<Introduction>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: widgets.length, initialIndex: _currentIndex, vsync: this);
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
        title: const Text('Metodo de Tomas'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TabBarView(controller: controller, children: widgets),
          Positioned(
            bottom: 40,
            child: TabPageSelector(
              color: Colors.black38,
              controller: controller,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = (_currentIndex + 1) % widgets.length;
            controller.animateTo(_currentIndex);
          });
        },
        hoverElevation: 0,
        elevation: 0,
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
