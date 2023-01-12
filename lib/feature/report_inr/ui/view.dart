import 'package:apkainzynierka/feature/report_inr/model/state.dart';
import 'package:apkainzynierka/feature/report_inr/service/cubit.dart';
import 'package:flutter/material.dart';

import '../../profile_editor/ui/view.dart';

class ReportInrView extends StatelessWidget {
  final ReportInrState state;
  final ReportInrCubit cubit;

  const ReportInrView({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Header(text: "Dodaj pomiar"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: _onInrInput,
              decoration: InputDecoration(
                  labelText: "Wprowadź wartość pomiaru INR",
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  filled: true,
                  errorText: state.error),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: cubit.submit,
                child: const Text('Dodaj'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onInrInput(String input) {
    final value = double.tryParse(input);

    if (value == null) {
      return;
    }

    cubit.setInr(value);
  }
}
