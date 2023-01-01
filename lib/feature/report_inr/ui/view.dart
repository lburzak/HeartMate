import 'package:apkainzynierka/feature/report_inr/model/state.dart';
import 'package:apkainzynierka/feature/report_inr/service/cubit.dart';
import 'package:flutter/material.dart';

class ReportInrView extends StatelessWidget {
  final ReportInrState state;
  final ReportInrCubit cubit;

  const ReportInrView({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Dodaj pomiar'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: _onInrInput,
              decoration: InputDecoration(
                  hintText: 'Wprowadź wartość pomiaru INR',
                  border: const OutlineInputBorder(),
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
