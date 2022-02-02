import 'package:custom_cubit_application/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../Theming/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor,
      this.text = "",
      this.icon = Icons.favorite_border,
      this.isIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: isIcon == true
          ? Center(
              child: Icon(
              icon,
              color: color,
            ))
          : Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            ),
    );
  }
}
