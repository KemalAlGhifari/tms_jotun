import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: context.locale,
      items: context.supportedLocales.map((Locale
 locale) {
        return DropdownMenuItem<Locale>(
          value: locale,
          child: Text(locale.toString()),
        );
      }).toList(),
      onChanged: (Locale? locale) {
        if (locale != null) {
          context.locale = locale;
        }
      },
    );
  }
}