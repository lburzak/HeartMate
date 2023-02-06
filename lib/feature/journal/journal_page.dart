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
import 'package:apkainzynierka/feature/journal/usecase/get_highlights_for_month.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_rating_for_inr_measurement.dart';
import 'package:apkainzynierka/feature/journal/usecase/get_summary_for_day.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/therapy_report_wizard.dart';
import 'package:apkainzynierka/main.dart';
import 'package:apkainzynierka/widget/action_button.dart';
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
            builder: (context, state) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActionButton(
                          onPressed: () =>
                              TherapyReportWizard.showAsModal(context),
                          label: "Generuj raport",
                          icon: Icons.receipt_long),
                    ),
                    JournalView(state: state, cubit: context.read()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class JournalContainer extends KiwiContainer {
  JournalContainer(AppContainer appContainer) : super.scoped() {
    registerFactory((r) => JournalCubit(r(), r()));
    registerFactory<DoseRepository>((r) => LocalDoseRepository(r()));
    registerFactory<ScheduleRepository>((r) => LocalScheduleRepository(r()));
    registerFactory<InrMeasurementRepository>(
        (r) => LocalInrMeasurementRepository(r()));
    registerFactory<ProfileRepository>((r) => LocalProfileRepository(r()));
    registerFactory((r) => GetRatingForInrMeasurement(r()));
    registerFactory((r) => GetHighlightsForMonth(r(), r(), r(), r()));
    registerFactory((r) => GetSummaryForDay(r(), r(), r(), r(), r()));
    registerFactory((r) => r.resolve<BoxDatabase>().inrMeasurementsBox);
    registerInstance<BoxDatabase>(appContainer.resolve());
  }
}
