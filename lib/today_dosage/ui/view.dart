import 'package:apkainzynierka/today_dosage/model/state.dart';
import 'package:apkainzynierka/today_dosage/service/cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide Router;

class TodayDosageView extends StatelessWidget {
  final TodayDosageState state;
  final TodayDosageCubit cubit;

  const TodayDosageView({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DottedBorder(
          color: state.taken ? Colors.transparent : Colors.white,
          strokeCap: StrokeCap.round,
          dashPattern: const [8, 8],
          strokeWidth: state.taken ? 0 : 4,
          child: SizedBox.expand(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: getBackgroundColor(), elevation: 0),
                onLongPress: () => cubit.showCustomDosageScreen(),
                onPressed: () => cubit.toggleTaken(),
                child: Text(
                  "Dzisiejsza dawka\n\n"
                  " ${state.taken ? "Przyjęto dawkę" : "Przyjmij dawkę"}"
                  " ${state.potency}"
                  " mg",
                  textAlign: TextAlign.center,
                )),
          ),
        ),
      ),
    );
  }

  Color getBackgroundColor() {
    if (state.scheduleUndefined) {
      return Colors.amber;
    }

    if (state.taken) {
      return Colors.green;
    }
    return Colors.transparent;
  }
}
