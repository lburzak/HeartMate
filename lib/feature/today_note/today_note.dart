import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_note_repository.dart';
import 'package:apkainzynierka/domain/repository/note_repository.dart';
import 'package:apkainzynierka/feature/today_note/cubit.dart';
import 'package:apkainzynierka/feature/today_note/view.dart';
import 'package:apkainzynierka/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class TodayNote extends StatelessWidget {
  const TodayNote({super.key});

  @override
  Widget build(BuildContext context) {
    final module = TodayNoteModule(context.read());
    return BlocProvider<TodayNoteCubit>.value(
      value: module.resolve(),
      child: BlocBuilder<TodayNoteCubit, String>(
        builder: (context, state) => TodayNoteView(
            onChanged: context.read<TodayNoteCubit>().update, content: state),
      ),
    );
  }
}

class TodayNoteModule extends KiwiContainer {
  TodayNoteModule(AppContainer appContainer) : super.scoped() {
    registerFactory((r) => TodayNoteCubit(r.resolve()));
    registerFactory<NoteRepository>(
        (r) => LocalNoteRepository(r.resolve<BoxDatabase>().notesBox));
    registerInstance<BoxDatabase>(appContainer.resolve());
  }
}
