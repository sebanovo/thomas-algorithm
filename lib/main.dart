import 'package:flutter/material.dart';
import 'package:thomas_algorithm/screens/home.dart';
import 'package:thomas_algorithm/screens/introduction.dart';

void main() {
  runApp(const MyApp());
}

// List of icons
List<Widget> widgets = const [
  Icon(Icons.home),
  Icon(Icons.settings),
  Icon(Icons.person),
];

final Map<String, WidgetBuilder> routes = {
  '/introduction': (BuildContext context) => const Introduction(),
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
      initialRoute: '/introduction',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
