import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart'; // Import intl untuk pengaturan format tanggal

class CalendarFieldInput extends StatelessWidget {
  final String name;
  final DateTime? initialValue;

  const CalendarFieldInput({
    super.key,
    required this.name,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      initialValue: initialValue,
      inputType: InputType.date,
      format: DateFormat('dd-MM-yyyy'), // Set format menjadi tanggal-bulan-tahun
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffix: Icon(
          Icons.calendar_month_rounded,
          color: Colors.black,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
