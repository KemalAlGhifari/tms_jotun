import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';

class TopTittle extends StatelessWidget {
  final String tittle;
  const TopTittle({required this.tittle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), 
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), 
          ),
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
          tittle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.black,
            fontSize: FontSize.normal.value,
            fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            width: 100,
            height: 3,
            color: ColorManager.primary,
          )
        ],
      ),
    );
  }
}