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

var initialRoute = '/home';

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
