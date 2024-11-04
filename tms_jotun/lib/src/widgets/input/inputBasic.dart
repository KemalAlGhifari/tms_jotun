import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputTextBasic extends StatelessWidget {
    final String name;
  final String placeholder;
  const InputTextBasic({
    required this.name,
    required this.placeholder,
    super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: placeholder,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green), // Garis bawah saat tidak fokus
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2), // Garis bawah saat fokus
        ),
      ),
    );
  }
}