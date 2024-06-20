// intro_pages.dart
import 'package:flutter/material.dart';
import 'one.dart';
import 'two.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  _IntroPagesState createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          if (page == 2) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        },
        children: const [
          PageOne(),
          PageTwo(),
          SizedBox.shrink(), // Página vacía para redirigir
        ],
      ),
    );
  }
}
