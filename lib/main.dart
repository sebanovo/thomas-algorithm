// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/index.dart';

// void main() {
//   runApp(const MyApp());
// }

// List<Widget> widgets = const [
//   Icon(Icons.home),
//   Icon(Icons.settings),
//   Icon(Icons.person),
// ];

// final Map<String, WidgetBuilder> routes = {
//   '/': (BuildContext context) => const SplashScreen(),
//   '/intro': (BuildContext context) => const IntroPages(),
//   '/home': (BuildContext context) => const HomaPage(),
// };

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "My first app",
//       initialRoute: '/',
//       routes: routes,
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// List of icons
List<Widget> widgets = const [
  Icon(Icons.home),
  Icon(Icons.settings),
  Icon(Icons.person),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metodo de thomas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: widgets.length, initialIndex: _index, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metodo de Tomas'),
        centerTitle: true,
      ),
      // Building UI
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

      // Creating floating action button for navigation
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(
            onPressed: () {
              (_index != widgets.length - 1) ? _index++ : _index = 0;
              controller.animateTo(_index);
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
