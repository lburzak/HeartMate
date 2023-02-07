import 'package:apkainzynierka/feature/week_preview/model/state.dart';
import 'package:apkainzynierka/feature/week_preview/service/cubit.dart';
import 'package:apkainzynierka/theme/brand_theme.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekPreviewView extends StatelessWidget {
  final WeekPreviewCubit cubit;
  final WeekPreviewState state;

  const WeekPreviewView(this.cubit, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            7,
            (index) => Column(children: [
                  Text(
                    DateFormat("E", "pl_PL").format(
                        DateTime.now().week.monday.add(Duration(days: index))),
                    style: state.days[index].isToday
                        ? const TextStyle(fontWeight: FontWeight.bold)
                        : null,
                  ),
                  DailyDosageCircle(
                    isToday: state.days[index].isToday,
                    dosage: state.days[index].dosage,
                    taken: state.days[index].taken,
                  )
                ])));
  }
}

class DailyDosageCircle extends StatelessWidget {
  final double? dosage;
  final bool? taken;
  final bool isToday;

  const DailyDosageCircle({
    Key? key,
    this.dosage,
    required this.isToday,
    required this.taken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: Material(
        shape: CircleBorder(
            side: BorderSide(
          color: getBorderColor(context),
          width: isToday ? 5 : 2,
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

  Color getBorderColor(BuildContext context) {
    if (dosage == null) {
      return Colors.transparent;
    }

    if (taken == null) {
      return Colors.white38;
    }

    if (taken == true) {
      return BrandTheme.of(context).goodColor;
    }

    return BrandTheme.of(context).badColor;
  }
}
