import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/app_colors.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.emeraldGreen,
      child: const Center(
        child: Text(
          "Página 2",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
