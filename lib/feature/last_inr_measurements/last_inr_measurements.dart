import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_inr_measurement_repository.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/model/state.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/service/cubit.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/ui/view.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class LastInrMeasurements extends StatelessWidget {
  const LastInrMeasurements({super.key});

  @override
  Widget build(BuildContext context) {
    final container = _buildContainer(context.read());

    return BlocProvider<LastInrMeasurementsCubit>(
      create: (context) => container.resolve(),
      child: BlocBuilder<LastInrMeasurementsCubit, LastInrMeasurementsState>(
          builder: (context, state) =>
              InrChart(state: state, cubit: context.read())),
    );
  }
}

KiwiContainer _buildContainer(AppContainer appContainer) {
  KiwiContainer c = KiwiContainer.scoped();

  c.registerInstance<BoxDatabase>(appContainer.resolve());
  c.registerInstance<EventBus>(appContainer.resolve());
  c.registerFactory(
      (r) => LastInrMeasurementsCubit(r.resolve(), r.resolve(), r.resolve()));
  c.registerFactory<InrMeasurementRepository>((r) =>
      LocalInrMeasurementRepository(
          r.resolve<BoxDatabase>().inrMeasurementsBox));
  c.registerFactory<ProfileRepository>(
      (r) => LocalProfileRepository(r.resolve()));

  return c;
}
