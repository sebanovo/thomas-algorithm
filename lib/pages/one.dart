import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/app_colors.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.redWine,
      child: const Center(
        child: Text(
          "Página 1",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
