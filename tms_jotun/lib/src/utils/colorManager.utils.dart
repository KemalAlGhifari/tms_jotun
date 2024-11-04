import 'package:flutter/material.dart';

class ColorManager {


  static Color primary = HexColor.fromHex("#022569");
  static Color textBlack = HexColor.fromHex("#000000");
  static Color white = const Color(0xffffffff);
   static Color borderGrey = HexColor.fromHex("#EAEAEA");
   static Color borderLightGrey = HexColor.fromHex("#9CA3AF");

  
  static Color getColor(String color) {
    if (color.isEmpty) {
      color = '#FFFFFF';
    } else if (!color.startsWith('#')) {
      color = '#$color';
    }
    return HexColor.fromHex(color);
  }
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString =
          "FF$hexColorString"; // Tambahkan opacity 100% jika tidak ada nilai transparansi
    } else if (hexColorString.length != 8) {
      throw FormatException("Invalid hex color string");
    }
    return Color(int.parse(hexColorString, radix: 16));
  }

  String toHex({bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }
}
