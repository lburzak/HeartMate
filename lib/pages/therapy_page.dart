import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_container.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_cubit.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_router.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

class TherapyPage extends StatefulWidget {
  const TherapyPage({super.key});

  @override
  State<TherapyPage> createState() => _TherapyPageState();
}

class _TherapyPageState extends State<TherapyPage> {
  late final KiwiContainer dailyDosageContainer;

  @override
  void initState() {
    super.initState();
    dailyDosageContainer = buildTodayDosageContainer(context,
        boxDatabase: context.read<BoxDatabase>());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: dailyDosageContainer.resolve<TodayDosageCubit>()),
        Provider.value(value: dailyDosageContainer.resolve<TodayDosageRouter>())
      ],
      child: BlocBuilder<TodayDosageCubit, TodayDosageState>(
          builder: (context, state) => SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [TodayDosageView(state)],
                ),
              )),
    );
  }
}
