import 'package:apkainzynierka/feature/week_preview/model/state.dart';
import 'package:apkainzynierka/feature/week_preview/service/cubit.dart';
import 'package:flutter/material.dart';

class WeekPreviewView extends StatelessWidget {
  final WeekPreviewCubit cubit;
  final WeekPreviewState state;

  const WeekPreviewView(this.cubit, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              7,
              (index) => Column(children: [
                    const Text("Pn"),
                    const SizedBox(
                      height: 5,
                    ),
                    DailyDosageCircle(
                      dosage: state.days[index].dosage,
                    )
                  ]))),
    ));
  }
}

class DailyDosageCircle extends StatelessWidget {
  final double? dosage;

  const DailyDosageCircle({
    Key? key,
    this.dosage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Material(
        shape: const CircleBorder(
            side: BorderSide(
          color: Colors.green,
          width: 2,
        )),
        child: Center(child: Text("$dosage")),
      ),
    );
  }
}
