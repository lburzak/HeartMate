import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/feature/schedule_wizard/schedule_wizard_page.dart';
import 'package:apkainzynierka/main/main_view.dart';
import 'package:apkainzynierka/theme/theme_constants.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  await BoxDatabase.init();
  runApp(const MyApp());
}

AppContainer _appContainer = AppContainer();

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => Provider<AppContainer>(
        create: (context) => _appContainer, child: const MainView()),
  ),
  GoRoute(
    path: '/schedules/current',
    builder: (context, state) => Provider<AppContainer>(
        create: (context) => _appContainer, child: const ScheduleWizardPage()),
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
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
