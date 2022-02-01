import 'package:custom_cubit_application/Theming/colors.dart';
import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {

  final double size;
  final String text;
  final Color color;

  //final theme = AppColors();


  const AppTitleText({ Key? key, 
  required this.text, 
  this.size = 30.0, 
  this.color = AppColors.bigTextColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color, 
        fontSize: size,
        fontWeight: FontWeight.bold,
        ),
    );
  }
}