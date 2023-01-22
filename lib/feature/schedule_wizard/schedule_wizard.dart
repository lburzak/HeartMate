import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/cubit.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/router.dart';
import 'package:apkainzynierka/feature/schedule_wizard/ui/router.dart';
import 'package:apkainzynierka/feature/schedule_wizard/ui/view.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/create_schedule.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/get_step_dosage.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

class ScheduleWizard extends StatelessWidget {
  const ScheduleWizard({super.key});

  @override
  Widget build(BuildContext context) {
    final container = _buildContainer(context, context.read());

    return MultiProvider(
      providers: [
        Provider<ScheduleWizardCubit>(create: (context) => container.resolve())
      ],
      builder: (context, child) =>
          BlocBuilder<ScheduleWizardCubit, ScheduleWizardState>(
              builder: (context, state) => ScheduleWizardView(
                  cubit: context.read<ScheduleWizardCubit>(), state: state)),
    );
  }
}

KiwiContainer _buildContainer(BuildContext context, AppContainer appContainer) {
  final c = KiwiContainer.scoped();

  c.registerInstance<BoxDatabase>(appContainer.resolve());
  c.registerInstance<EventBus>(appContainer.resolve());

  c.registerFactory((r) =>
      ScheduleWizardCubit(r.resolve(), r.resolve(), r.resolve(), r.resolve()));

  c.registerFactory<ScheduleWizardRouter>(
      (r) => MaterialScheduleWizardRouter(context));
  c.registerFactory((r) => CreateSchedule(r.resolve()));
  c.registerFactory((r) => GetStepDosage(r.resolve()));

  c.registerFactory<ScheduleRepository>(
      (r) => LocalScheduleRepository(r.resolve()));
  c.registerFactory<ProfileRepository>(
      (r) => LocalProfileRepository(r.resolve()));

  return c;
}
