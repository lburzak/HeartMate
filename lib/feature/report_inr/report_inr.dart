import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/feature/report_inr/model/state.dart';
import 'package:apkainzynierka/feature/report_inr/service/cubit.dart';
import 'package:apkainzynierka/feature/report_inr/service/routing.dart';
import 'package:apkainzynierka/feature/report_inr/ui/routing.dart';
import 'package:apkainzynierka/feature/report_inr/ui/view.dart';
import 'package:apkainzynierka/feature/report_inr/usecase/report_inr.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class ReportInrDialog extends StatelessWidget {
  const ReportInrDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final container = _buildContainer(context, context.read());
    return BlocProvider<ReportInrCubit>(
      create: (context) => container.resolve(),
      child: BlocBuilder<ReportInrCubit, ReportInrState>(
        builder: (context, state) =>
            ReportInrView(state: state, cubit: context.read()),
      ),
    );
  }
}

KiwiContainer _buildContainer(BuildContext context, AppContainer appContainer) {
  final c = KiwiContainer.scoped();

  c.registerInstance<BoxDatabase>(appContainer.resolve());
  c.registerInstance<EventBus>(appContainer.resolve());
  c.registerFactory(
      (r) => ReportInrCubit(r.resolve(), r.resolve(), r.resolve()));
  c.registerFactory((r) => ReportInr(r.resolve()));
  c.registerFactory<InrMeasurementRepository>((r) =>
      LocalInrMeasurementRepository(
          r.resolve<BoxDatabase>().inrMeasurementsBox));
  c.registerFactory<ReportInrRouting>((r) => MaterialReportInrRouting(context));

  return c;
}
