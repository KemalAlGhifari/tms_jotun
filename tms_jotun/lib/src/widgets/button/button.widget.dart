import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';

class ButtonStandart extends StatelessWidget {
  final String tittle;
  final Color? color;
  final Color? textColor;
  final double? minHeight;
  final double? minWidth;
  final Function onTap;
  const ButtonStandart({
    required this.tittle,
    this.color,
    this.textColor,
    required this.onTap,
    this.minHeight,
    this.minWidth,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: 
      BoxConstraints(
        minHeight: minHeight ?? 0,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color ?? ColorManager.primary
        ),
        child: Center(
          child: Text(
          tittle,
          style: TextStyle(
              fontFamily: 'Lato',
              color: textColor ?? Colors.white,
              fontSize: FontSize.sm.value,
              fontWeight: FontWeight.w600
              ),
          ),
        ),
      ),
    );
  }
}