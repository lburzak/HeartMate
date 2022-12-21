import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/cubit.dart';
import 'package:apkainzynierka/feature/schedule_wizard/ui/view.dart';
import 'package:apkainzynierka/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<ScheduleWizardCubit>()])
import 'main.mocks.dart';

void main() => testWidget(() => ScheduleWizardView(
      cubit: MockScheduleWizardCubit(),
      state: ScheduleWizardState(
          scheduleType: ScheduleType.daily,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          dosages: [1.5]),
    ));

void testWidget(Widget Function() builder) {
  runApp(WidgetTestApp(builder: builder));
}

class WidgetTestApp extends StatelessWidget {
  final Widget Function() builder;

  const WidgetTestApp({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: darkTheme,
        home: Scaffold(
          body: builder(),
        ));
  }
}
