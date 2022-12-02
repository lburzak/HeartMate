import 'dart:async';

import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/get_today_dosage.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/domain/usecase/revert_today_dose.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_cubit.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_navigation_event.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_router.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';

KiwiContainer buildTodayDosageContainer({required BuildContext context}) {
  final navigationEventBus = StreamController<TodayDosageNavigationEvent>();
  final c = KiwiContainer.scoped();

  c.registerSingleton((r) => BoxDatabase());

  c.registerFactory((r) => TodayDosageCubit(r(), r(), r(), r(), r()));
  c.registerFactory((r) => TodayDosageRouter(r(), r(), r()));

  c.registerFactory((r) => RevertTodayDose(r()));
  c.registerFactory((r) => GetTodayDosage(r()));
  c.registerFactory((r) => ReportDoseTaken(r(), r()));

  c.registerFactory((r) => Logger());

  c.registerFactory<ScheduleRepository>((r) => LocalScheduleRepository());
  c.registerFactory<DoseRepository>((r) => LocalDoseRepository(r()));

  c.registerInstance<Sink<TodayDosageNavigationEvent>>(navigationEventBus.sink);
  c.registerInstance<Stream<TodayDosageNavigationEvent>>(
      navigationEventBus.stream);

  c.registerInstance(context);

  return c;
}
