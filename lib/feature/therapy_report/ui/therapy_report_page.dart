import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_inr_measurement_repository.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/inr_measurement_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/pdf_report_preview.dart';
import 'package:apkainzynierka/feature/therapy_report/usecase/get_therapy_report.dart';
import 'package:apkainzynierka/main.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

class TherapyReportPage extends StatelessWidget {
  final DateTime periodStart;
  final DateTime periodEnd;

  const TherapyReportPage(
      {super.key, required this.periodStart, required this.periodEnd});

  @override
  Widget build(BuildContext context) {
    final container = TherapyReportContainer(appContainer: context.read());

    return Scaffold(
      body: SafeArea(
        child: Provider<GetTherapyReport>.value(
          value: container.resolve(),
          builder: (context, _) => PdfReportPreview(
              report: context.read<GetTherapyReport>()(
                  start: periodStart, end: periodEnd)),
        ),
      ),
    );
  }
}

class TherapyReportContainer extends KiwiContainer {
  TherapyReportContainer({required AppContainer appContainer})
      : super.scoped() {
    registerFactory((c) =>
        GetTherapyReport(c.resolve(), c.resolve(), c.resolve(), c.resolve()));
    registerFactory<ProfileRepository>(
        (c) => LocalProfileRepository(c.resolve()));
    registerFactory<ScheduleRepository>(
        (c) => LocalScheduleRepository(c.resolve()));
    registerFactory<DoseRepository>((c) => LocalDoseRepository(c.resolve()));
    registerFactory<InrMeasurementRepository>((c) =>
        LocalInrMeasurementRepository(
            c.resolve<BoxDatabase>().inrMeasurementsBox));
    registerInstance(appContainer.resolve<BoxDatabase>());
  }
}
