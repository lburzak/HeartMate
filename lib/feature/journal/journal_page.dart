import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_inr_measurement_repository.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:apkainzynierka/feature/journal/service/cubit.dart';
import 'package:apkainzynierka/feature/journal/ui/view.dart';
import 'package:apkainzynierka/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final container = JournalContainer(context.read());

    return Scaffold(
      body: SafeArea(
        child: BlocProvider<JournalCubit>(
          create: (context) => container.resolve(),
          child: BlocBuilder<JournalCubit, JournalState>(
            builder: (context, state) =>
                JournalView(state: state, cubit: context.read()),
          ),
        ),
      ),
    );
  }
}

class JournalContainer extends KiwiContainer {
  JournalContainer(AppContainer appContainer) : super.scoped() {
    registerFactory((r) => JournalCubit(r(), r(), r(), r()));
    registerFactory<DoseRepository>((r) => LocalDoseRepository(r()));
    registerFactory<ScheduleRepository>((r) => LocalScheduleRepository(r()));
    registerFactory<InrMeasurementRepository>(
        (r) => LocalInrMeasurementRepository(r()));
    registerFactory<ProfileRepository>((r) => LocalProfileRepository(r()));
    registerInstance<BoxDatabase>(appContainer.resolve());
    registerFactory((r) => r.resolve<BoxDatabase>().inrMeasurementsBox);
  }
}
