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
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/introduction.dart';

void main() {
  runApp(const MyApp());
}

// List of icons
List<Widget> widgets = const [
  Icon(Icons.home),
  Icon(Icons.settings),
  Icon(Icons.person),
];

var initialRoute = '/intro';

final Map<String, WidgetBuilder> routes = {
  initialRoute: (BuildContext context) => const Introduction(),
  '/home': (BuildContext context) => const Home(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metodo de thomas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
