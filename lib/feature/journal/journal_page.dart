import 'package:apkainzynierka/feature/journal/model/state.dart';
import 'package:apkainzynierka/feature/journal/service/cubit.dart';
import 'package:apkainzynierka/feature/journal/ui/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final container = JournalContainer();

    return Scaffold(
      body: SafeArea(
        child: BlocProvider<JournalCubit>(
          create: (context) => container.resolve(),
          child: BlocBuilder<JournalCubit, JournalState>(
            builder: (context, state) =>
                JournalView(state: state, cubit: context.read()),
          ),
        ),
      ),
    );
  }
}

class JournalContainer extends KiwiContainer {
  JournalContainer() : super.scoped() {
    registerFactory((r) => JournalCubit());
  }
}
