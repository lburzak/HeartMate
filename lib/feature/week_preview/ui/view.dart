import 'package:apkainzynierka/feature/week_preview/model/state.dart';
import 'package:apkainzynierka/feature/week_preview/service/cubit.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                    Text(DateFormat("E", "pl_PL").format(
                        DateTime.now().week.monday.add(Duration(days: index)))),
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
    return SizedBox.square(
      dimension: 50,
      child: Material(
        shape: CircleBorder(
            side: BorderSide(
          color: dosage != null ? Colors.green : Colors.transparent,
          width: 2,
        )),
        child: Center(
            child: dosage != null
                ? Text("$dosage")
                : const Icon(
                    Icons.block,
                    color: Colors.white10,
                    size: 50,
                  )),
      ),
    );
  }
}
