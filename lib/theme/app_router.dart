import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/feature/main_page/main_view.dart';
import 'package:apkainzynierka/feature/profile_editor/profile_editor.dart';
import 'package:apkainzynierka/feature/schedule_wizard/schedule_wizard_page.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/therapy_report_page.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/therapy_report_wizard.dart';
import 'package:apkainzynierka/feature/welcome/util.dart';
import 'package:apkainzynierka/feature/welcome/welcome_page.dart';
import 'package:apkainzynierka/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

class AppRouter extends GoRouter {
  AppRouter(ShouldShowWelcomePage shouldShowWelcomePage,
      AppContainer appContainer) : super(
      initialLocation: shouldShowWelcomePage() ? '/welcome' : '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>
              Provider<AppContainer>(
                  create: (context) => appContainer, child: const MainView()),
        ),
        GoRoute(
          path: '/schedules/current',
          builder: (context, state) =>
              Provider<AppContainer>(
                  create: (context) => appContainer,
                  child: const ScheduleWizardPage()),
        ),
        GoRoute(
          path: '/profile/editor',
          builder: (context, state) =>
              Provider<AppContainer>(
                  create: (context) => appContainer,
                  child: const Scaffold(
                    body: ProfileEditor(),
                  )),
        ),
        GoRoute(
          path: '/welcome',
          builder: (context, state) =>
              Provider<AppContainer>(
                  create: (context) => appContainer,
                  child: const WelcomePage()),
        ),
        GoRoute(
          path: '/report',
          builder: (context, state) =>
              Provider<AppContainer>(
                  create: (context) => appContainer,
                  child: const TherapyReportWizard()),
        ),
        GoRoute(
          path: '/report/preview',
          builder: (context, state) =>
              Provider<AppContainer>(
                  create: (context) => appContainer,
                  child: Builder(builder: (context) {
                    final args =
                    TherapyReportPageArgs.fromQueryParams(state.queryParams);
                    return TherapyReportPage(
                        periodStart: args.periodStart,
                        periodEnd: args.periodEnd);
                  })),
        ),
      ]
  );
}

class AppRouterModule extends KiwiContainer {
  AppRouterModule(AppContainer appContainer) : super.scoped() {
    registerFactory<ProfileRepository>(
            (r) => LocalProfileRepository(r.resolve()));
    registerInstance<BoxDatabase>(appContainer.resolve());
    registerFactory((i) => ShouldShowWelcomePage(i()));
    registerFactory((i) => AppRouter(i(), appContainer));
  }
}
