import 'package:apkainzynierka/feature/custom_dosage/custom_dosage_view.dart';
import 'package:flutter/material.dart';

class CustomDosage extends StatelessWidget {
  const CustomDosage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDosageView(
      dosage: 0,
      onDosageDecrement: () {},
      onDosageIncrement: () {},
    );
  }

  static void showAsModal(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (_) => const CustomDosage());
  }
}
