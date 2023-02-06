import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final DateTime dateTime;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime selectedDate) onDateSelected;
  final DateFormat formatter = DateFormat("dd.MM.y");
  final String? label;

  String get dateTimeFormatted => formatter.format(dateTime);

  DateField({
    Key? key,
    required this.dateTime,
    required this.onDateSelected,
    this.label,
    required this.firstDate,
    required this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
        builder: (field) => GestureDetector(
            onTap: () {
              showDatePicker(
                helpText: "WYBIERZ DATĘ",
                context: context,
                initialDate: dateTime,
                firstDate: firstDate,
                lastDate: lastDate,
              ).then((value) {
                if (value == null) {
                  return;
                }

                onDateSelected(value);
              });
            },
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: label,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              child: Text(dateTimeFormatted),
            )));
  }
}
