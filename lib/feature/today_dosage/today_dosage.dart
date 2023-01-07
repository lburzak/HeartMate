import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/get_today_dosage.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/domain/usecase/revert_today_dose.dart';
import 'package:apkainzynierka/feature/today_dosage/model/state.dart';
import 'package:apkainzynierka/feature/today_dosage/service/cubit.dart';
import 'package:apkainzynierka/feature/today_dosage/service/router.dart';
import 'package:apkainzynierka/feature/today_dosage/ui/router.dart';
import 'package:apkainzynierka/feature/today_dosage/ui/view.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class TodayDosage extends StatelessWidget {
  const TodayDosage({super.key});

  @override
  Widget build(BuildContext context) {
    final container = buildTodayDosageContainer(context, context.read());
    return Provider<TodayDosageCubit>(
      create: (context) => container.resolve(),
      builder: (context, child) =>
          BlocBuilder<TodayDosageCubit, TodayDosageState>(
        builder: (context, state) {
          return TodayDosageView(state: state, cubit: context.read());
        },
      ),
    );
  }
}

KiwiContainer buildTodayDosageContainer(
    BuildContext context, AppContainer appContainer) {
  final c = KiwiContainer.scoped();

  c.registerInstance<BoxDatabase>(appContainer.resolve());
  c.registerInstance<EventBus>(appContainer.resolve());
  c.registerInstance(context);

  c.registerFactory((r) => TodayDosageCubit(r(), r(), r(), r(), r(), r(), r()));
  c.registerFactory<TodayDosageRouter>((r) => MaterialTodayDosageRouter(r()));

  c.registerFactory((r) => RevertTodayDose(r()));
  c.registerFactory((r) => GetTodayDosage(r()));
  c.registerFactory((r) => ReportDoseTaken(r(), r()));

  c.registerFactory((r) => Logger());

  c.registerFactory<ScheduleRepository>(
      (r) => LocalScheduleRepository(r.resolve()));
  c.registerFactory<DoseRepository>((r) => LocalDoseRepository(r()));

  return c;
}
