import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
import 'package:apkainzynierka/feature/report_inr/model/state.dart';
import 'package:apkainzynierka/feature/report_inr/service/cubit.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ReportInrView extends StatelessWidget {
  final ReportInrState state;
  final ReportInrCubit cubit;

  const ReportInrView({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Header(text: "Dodaj pomiar"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 120,
                child: DecimalNumberPicker(
                  selectedTextStyle:
                      const TextStyle(color: Colors.blue, fontSize: 26),
                  itemWidth: 40,
                  minValue: 0,
                  maxValue: 5,
                  decimalTextMapper: (numberText) => ".$numberText",
                  onChanged: (value) => cubit.setInr(value),
                  value: state.inr ?? 0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: cubit.submit,
                child: const Text('DODAJ'),
              ),
            ),
          ],
        ));
  }
}
