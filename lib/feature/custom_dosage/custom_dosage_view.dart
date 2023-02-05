import 'package:apkainzynierka/feature/schedule_wizard/ui/view.dart';
import 'package:flutter/material.dart';

class CustomDosageView extends StatelessWidget {
  final void Function() onDosageIncrement;
  final void Function() onDosageDecrement;
  final void Function() onSave;
  final double dosage;

  const CustomDosageView(
      {super.key,
      required this.onDosageIncrement,
      required this.onDosageDecrement,
      required this.dosage,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Niestandardowa dawka"),
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 8),
          child: Center(
            child: DosagePicker(
                onIncrement: onDosageIncrement,
                onDecrement: onDosageDecrement,
                dosage: dosage),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 16),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: onSave,
              child: const Text(
                "ZAPISZ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
