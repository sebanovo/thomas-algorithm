import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/app_colors.dart';

class HomaPage extends StatelessWidget {
  const HomaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: AppColors.royalBlue,
      ),
      body: const Center(
        child: Text(
          "Bienvenido a la Home Page",
          style: TextStyle(fontSize: 24, color: AppColors.darkGray),
        ),
      ),
    );
  }
}
