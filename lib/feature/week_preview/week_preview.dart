import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/feature/week_preview/model/state.dart';
import 'package:apkainzynierka/feature/week_preview/service/cubit.dart';
import 'package:apkainzynierka/feature/week_preview/ui/view.dart';
import 'package:apkainzynierka/feature/week_preview/usecase/get_day_previews_for_period.dart';
import 'package:apkainzynierka/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class WeekPreview extends StatelessWidget {
  const WeekPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final container = WeekPreviewContainer(appContainer: context.read());
    return BlocProvider<WeekPreviewCubit>(
      create: (_) => container.resolve(),
      child: BlocBuilder<WeekPreviewCubit, WeekPreviewState>(
        builder: (context, state) => WeekPreviewView(context.read(), state),
      ),
    );
  }
}

class WeekPreviewContainer extends KiwiContainer {
  WeekPreviewContainer({required AppContainer appContainer}) : super.scoped() {
    registerFactory((c) => WeekPreviewCubit(c.resolve()));
    registerFactory((c) => GetDayPreviewsForPeriod(c.resolve(), c.resolve()));
    registerFactory<ScheduleRepository>(
        (c) => LocalScheduleRepository(c.resolve()));
    registerFactory<DoseRepository>((c) => LocalDoseRepository(c.resolve()));
    registerInstance<BoxDatabase>(appContainer.resolve());
  }
}
