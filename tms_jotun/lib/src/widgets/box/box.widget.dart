import 'package:flutter/material.dart';

class ContainerStandart extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final double? minHeight;
  const ContainerStandart({
    required this.child,
    this.margin,
    this.minHeight,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: minHeight ?? 80
    ),
    child: Container(
      constraints: const BoxConstraints(
        maxHeight: double.infinity, 
      ),
      width: double.infinity,
      margin: margin ?? EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), 
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, -1), 
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), 
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), 
            ),
          ]
        ),
        child: child,
      ),
    );
  }
}