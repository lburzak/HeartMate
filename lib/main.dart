import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/feature/main_page/main_view.dart';
import 'package:apkainzynierka/feature/profile_editor/profile_editor.dart';
import 'package:apkainzynierka/feature/schedule_wizard/schedule_wizard_page.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/therapy_report_page.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/therapy_report_wizard.dart';
import 'package:apkainzynierka/feature/welcome/util.dart';
import 'package:apkainzynierka/feature/welcome/welcome_page.dart';
import 'package:apkainzynierka/theme/theme_constants.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  await BoxDatabase.init();
  initializeDateFormatting("pl_PL", null);
  runApp(const MyApp());
}

final AppContainer _appContainer = AppContainer();
final ShouldShowWelcomePage _shouldShowWelcomePage =
    ShouldShowWelcomePage(_appContainer);

final _router = GoRouter(
    initialLocation: _shouldShowWelcomePage() ? '/welcome' : '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Provider<AppContainer>(
            create: (context) => _appContainer, child: const MainView()),
      ),
      GoRoute(
        path: '/schedules/current',
        builder: (context, state) => Provider<AppContainer>(
            create: (context) => _appContainer,
            child: const ScheduleWizardPage()),
      ),
      GoRoute(
        path: '/profile/editor',
        builder: (context, state) => Provider<AppContainer>(
            create: (context) => _appContainer,
            child: const Scaffold(
              body: ProfileEditor(),
            )),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => Provider<AppContainer>(
            create: (context) => _appContainer, child: const WelcomePage()),
      ),
      GoRoute(
        path: '/report',
        builder: (context, state) => Provider<AppContainer>(
            create: (context) => _appContainer,
            child: const TherapyReportWizard()),
      ),
      GoRoute(
        path: '/report/preview',
        builder: (context, state) => Provider<AppContainer>(
            create: (context) => _appContainer,
            child: Builder(builder: (context) {
              final args =
                  TherapyReportPageArgs.fromQueryParams(state.queryParams);
              return TherapyReportPage(
                  periodStart: args.periodStart, periodEnd: args.periodEnd);
            })),
      ),
    ]);

class TherapyReportPageArgs {
  final DateTime periodStart;
  final DateTime periodEnd;

  const TherapyReportPageArgs(
      {required this.periodStart, required this.periodEnd});

  TherapyReportPageArgs.fromQueryParams(Map<String, String> params)
      : periodStart =
            DateTime.fromMillisecondsSinceEpoch(int.parse(params['start']!)),
        periodEnd =
            DateTime.fromMillisecondsSinceEpoch(int.parse(params['end']!));

  String toQueryParams() =>
      "start=${periodStart.millisecondsSinceEpoch}&end=${periodEnd.millisecondsSinceEpoch}";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HeartMate',
      theme: darkTheme,
      routerConfig: _router,
    );
  }
}

class AppContainer extends KiwiContainer {
  AppContainer() : super.scoped() {
    registerSingleton((r) => BoxDatabase());
    registerSingleton((r) => EventBus());
  }
}
