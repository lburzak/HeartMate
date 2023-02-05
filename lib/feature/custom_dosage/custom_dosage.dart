import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/feature/custom_dosage/custom_dosage_cubit.dart';
import 'package:apkainzynierka/feature/custom_dosage/custom_dosage_state.dart';
import 'package:apkainzynierka/feature/custom_dosage/custom_dosage_view.dart';
import 'package:apkainzynierka/feature/schedule_wizard/usecase/get_step_dosage.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

class CustomDosage extends StatelessWidget {
  const CustomDosage({super.key});

  @override
  Widget build(BuildContext context) {
    final module = CustomDosageModule(context.read());
    return BlocProvider<CustomDosageCubit>.value(
      value: module.resolve(),
      child: BlocBuilder<CustomDosageCubit, CustomDosageState>(
        builder: (context, state) => CustomDosageView(
          dosage: state.dosage,
          onDosageDecrement: context.read<CustomDosageCubit>().decrement,
          onDosageIncrement: context.read<CustomDosageCubit>().increment,
          onSave: context.read<CustomDosageCubit>().save,
        ),
      ),
    );
  }

  static void showAsModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Provider<AppContainer>.value(
            value: context.read(), child: const CustomDosage()));
  }
}

class CustomDosageModule extends KiwiContainer {
  CustomDosageModule(AppContainer appContainer) : super.scoped() {
    registerFactory((r) => CustomDosageCubit(r.resolve(), r.resolve()));
    registerFactory((r) => GetStepDosage(r.resolve()));
    registerFactory(
        (r) => ReportDoseTaken(r.resolve(), r.resolve(), r.resolve()));
    registerFactory<ScheduleRepository>(
        (r) => LocalScheduleRepository(r.resolve()));
    registerFactory<DoseRepository>((r) => LocalDoseRepository(r.resolve()));
    registerFactory<ProfileRepository>(
        (r) => LocalProfileRepository(r.resolve()));
    registerInstance(appContainer.resolve<BoxDatabase>());
    registerInstance(appContainer.resolve<EventBus>());
  }
}
