import 'package:apkainzynierka/data/adapter/dose_adapter.dart';
import 'package:apkainzynierka/data/adapter/inr_measurement_adapter.dart';
import 'package:apkainzynierka/data/adapter/inr_range_adapter.dart';
import 'package:apkainzynierka/data/adapter/profile_adapter.dart';
import 'package:apkainzynierka/data/adapter/profile_entry_adapter.dart';
import 'package:apkainzynierka/data/adapter/schedule_adapter.dart';
import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_service.dart';
import 'package:apkainzynierka/feature/main_page/main_view.dart';
import 'package:apkainzynierka/feature/profile_editor/profile_editor.dart';
import 'package:apkainzynierka/feature/schedule_wizard/schedule_wizard_page.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/therapy_report_page.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/therapy_report_wizard.dart';
import 'package:apkainzynierka/feature/welcome/util.dart';
import 'package:apkainzynierka/feature/welcome/welcome_page.dart';
import 'package:apkainzynierka/theme/brand_theme.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

const AndroidNotificationDetails androidNotificationDetails =
AndroidNotificationDetails(
    "_reminderNotificationChannelId", "_reminderNotificationChannelName",
    channelDescription: "_reminderNotificationChannelDescription",
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker');
const det = NotificationDetails(android: androidNotificationDetails);

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  Provider.debugCheckInvalidValueType = null;
  final AppContainer appContainer = AppContainer();
  await appContainer.resolve<BoxDatabase>().initialize();
  await appContainer.resolve<NotificationService>().initialize();
  await appContainer.resolve<DoseReminderScheduler>().initialize();
  final ShouldShowWelcomePage shouldShowWelcomePage =
  ShouldShowWelcomePage(appContainer);
  final router = GoRouter(
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
      ]);
  runApp(MyApp(router: router));
}

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
      "start=${periodStart.millisecondsSinceEpoch}&end=${periodEnd
          .millisecondsSinceEpoch}";
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HeartMate',
      locale: const Locale("pl"),
      supportedLocales: const [Locale("pl")],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue,
          accentColor: Colors.blue,
          chipTheme: ChipThemeData(
              labelStyle: GoogleFonts.balooDa2(
                  fontSize: 14, fontWeight: FontWeight.bold)),
          inputDecorationTheme: const InputDecorationTheme(
              floatingLabelStyle: TextStyle(fontSize: 20),
              suffixStyle: TextStyle(fontSize: 16),
              labelStyle: TextStyle(fontSize: 20)),
          textTheme: GoogleFonts.balooDa2TextTheme()
              .apply(bodyColor: Colors.white)
              .copyWith(
              titleMedium: GoogleFonts.balooDa2(fontSize: 20),
              bodyMedium: GoogleFonts.balooDa2(fontSize: 16),
              bodySmall: GoogleFonts.balooDa2(fontSize: 12),
              headlineLarge: GoogleFonts.poppins(
                  fontSize: 26, fontWeight: FontWeight.w200)),
          extensions: [
            const BrandTheme(
              goodColor: Color(0xff2F802D),
              goodTextColor: Color(0xFF62DF00),
              badColor: Color(0xffF34E4E),
              badTextColor: Color(0xffFFB4AA),
              warningColor: Color(0xFF554200),
              warningTextColor: Color(0xFFDFA100),
            )
          ]),
      routerConfig: router,
    );
  }
}

class AppContainer extends KiwiContainer {
  AppContainer() : super.scoped() {
    registerSingleton((r) => BoxDatabase([
      DoseAdapter(),
      ScheduleAdapter(),
      ProfileAdapter(),
      InrRangeAdapter(),
      InrMeasurementAdapter(),
      ProfileEntryAdapter()
    ]));

    registerSingleton((r) => EventBus());
    registerSingleton((r) => DoseReminderScheduler(r.resolve()));
    registerSingleton((r) => FlutterLocalNotificationsPlugin());
    registerSingleton((r) => NotificationService(r.resolve()));
    registerSingleton((r) => Workmanager());
  }
}
