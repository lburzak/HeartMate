import 'package:apkainzynierka/common/navigation/navigation_handler.dart';
import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_cubit.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_router.dart';
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

    return SizedBox(
      height: 120,
      child: ElevatedButton(
          child: Text(
              "Today dosage: ${widget.state.taken ? "taken" : "not taken"}"),
          onLongPress: () => cubit.showCustomDosageScreen(),
          onPressed: () => cubit.toggleTaken()),
    );
  }
}
