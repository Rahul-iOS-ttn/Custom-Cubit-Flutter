import 'package:custom_cubit_application/Theming/colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  final double size;
  final String text;
  final Color color;


  const AppText({ Key? key, 
  required this.text, 
  this.size = 16.0, 
  this.color = AppColors.textColor2 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color, 
        fontSize: size,
        ),
    );
  }
}