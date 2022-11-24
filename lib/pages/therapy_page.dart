import 'dart:async';

import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/domain/usecase/revert_today_dose.dart';
import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_cubit.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_navigation_event.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_router.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class TherapyPage extends StatefulWidget {
  const TherapyPage({super.key});

  @override
  State<TherapyPage> createState() => _TherapyPageState();
}

class _TherapyPageState extends State<TherapyPage> {
  late final StreamController<TodayDosageNavigationEvent> _navigationEventBus;

  @override
  void initState() {
    _navigationEventBus = StreamController<TodayDosageNavigationEvent>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ScheduleRepository>(
          create: (context) => LocalScheduleRepository(),
        ),
        Provider<DoseRepository>(
          create: (context) => LocalDoseRepository(),
        )
      ],
      builder: (_, __) => MultiProvider(
        providers: [
          Provider<Stream<TodayDosageNavigationEvent>>.value(
              value: _navigationEventBus.stream),
          Provider<Sink<TodayDosageNavigationEvent>>.value(
              value: _navigationEventBus.sink),
          Provider<Logger>(create: (context) => Logger()),
          Provider(
            create: (context) =>
                ReportDoseTaken((context.read()), context.read()),
          ),
          Provider(
            create: (context) => RevertTodayDose(context.read()),
          )
        ],
        builder: (_, __) => MultiProvider(
            providers: [
              Provider<TodayDosageRouter>(
                create: (context) =>
                    TodayDosageRouter(context.read(), context.read(), context),
              ),
              BlocProvider(
                create: (context) => TodayDosageCubit(
                    context.read(), context.read(), context.read()),
              ),
            ],
            builder: (context, child) =>
                BlocBuilder<TodayDosageCubit, TodayDosageState>(
                    builder: (context, state) => SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [TodayDosageView(state)],
                          ),
                        ))),
      ),
    );
  }
}
