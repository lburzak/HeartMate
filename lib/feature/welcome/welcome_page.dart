import 'package:apkainzynierka/feature/welcome/service/cubit.dart';
import 'package:apkainzynierka/feature/welcome/service/router.dart';
import 'package:apkainzynierka/feature/welcome/ui/router.dart';
import 'package:apkainzynierka/feature/welcome/ui/view.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final container =
        WelcomeContainer(context: context, appContainer: context.read());

    return Scaffold(
      body: BlocProvider<WelcomeCubit>(
        create: (context) => container.resolve(),
        child: BlocBuilder<WelcomeCubit, void>(
          builder: (context, state) {
            return WelcomeView(
              cubit: context.read(),
            );
          },
        ),
      ),
    );
  }
}

class WelcomeContainer extends KiwiContainer {
  WelcomeContainer(
      {required BuildContext context, required AppContainer appContainer})
      : super.scoped() {
    registerFactory((r) => WelcomeCubit(r.resolve(), r.resolve()));
    registerFactory<WelcomeRouter>((r) => MaterialWelcomeRouter(context));
    registerInstance<EventBus>(appContainer.resolve());
  }
}
