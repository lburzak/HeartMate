import 'package:apkainzynierka/common/navigation/navigation_handler.dart';
import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_cubit.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayDosageView extends StatefulWidget {
  final TodayDosageState state;

  const TodayDosageView(this.state, {super.key});

  @override
  State<TodayDosageView> createState() => _TodayDosageViewState();
}

class _TodayDosageViewState extends State<TodayDosageView>
    with NavigationHandler<TodayDosageRouter, TodayDosageView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodayDosageCubit>();
    const state = TodayDosageState(
        taken: true, potency: 2, custom: false, scheduleUndefined: true);
    //const state = widget.state;
    return SizedBox(
        height: 120,
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
                    backgroundColor: getBackgroundColor(),
                    elevation: 0
                  ),
                  onLongPress: () => cubit.showCustomDosageScreen(),
                  onPressed: () => cubit.toggleTaken(),
                  child: Text("Dzisiejsza dawka\n\n"
                      " ${state.taken ? "Przyjęto dawkę" : "Przyjmij dawkę"}"
                      " ${state.potency}"
                      " mg")),
            ),
          ),
        ));
  }

  Color getBackgroundColor() {
    if (widget.state.scheduleUndefined) {
      return Colors.amber;
    }

    if (widget.state.taken) {
      return Colors.green;
    }
    return Colors.transparent;
  }
}