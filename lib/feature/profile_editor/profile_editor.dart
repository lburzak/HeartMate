import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/feature/profile_editor/model/state.dart';
import 'package:apkainzynierka/feature/profile_editor/service/cubit.dart';
import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
import 'package:apkainzynierka/feature/profile_editor/usecase/schedule_notifications.dart';
import 'package:apkainzynierka/feature/profile_editor/usecase/update_profile.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class ProfileEditor extends StatelessWidget {
  const ProfileEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final container = ProfileEditorContainer(context.read());

    return BlocProvider<ProfileEditorCubit>(
      create: (context) => container.resolve(),
      child: BlocBuilder<ProfileEditorCubit, ProfileEditorState>(
          builder: (context, state) =>
              ProfileEditorView(state: state, cubit: context.read())),
    );
  }
}

class ProfileEditorContainer extends KiwiContainer {
  ProfileEditorContainer(AppContainer appContainer) : super.scoped() {
    registerFactory((r) =>
        ProfileEditorCubit(r.resolve(), r.resolve(), r.resolve(), r.resolve()));
    registerFactory((r) => UpdateProfile(r.resolve()));
    registerFactory((r) => ScheduleNotifications());
    registerFactory<ProfileRepository>(
        (r) => LocalProfileRepository(r.resolve()));
    registerInstance<BoxDatabase>(appContainer.resolve());
    registerInstance<EventBus>(appContainer.resolve());
  }
}
