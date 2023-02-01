import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final DateTime dateTime;
  final void Function(DateTime selectedDate) onDateSelected;
  final DateFormat formatter = DateFormat("dd.MM.y");

  String get dateTimeFormatted => formatter.format(dateTime);

  DateField({
    Key? key,
    required this.dateTime,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
        builder: (field) => GestureDetector(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: dateTime,
                firstDate: DateTime.now(),
                lastDate: DateTime(2050),
              ).then((value) {
                if (value == null) {
                  return;
                }

                onDateSelected(value);
              });
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: "Data rozpoczęcia",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              child: Text(dateTimeFormatted),
            )));
  }
}
