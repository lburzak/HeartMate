import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/feature/profile_summary/service/cubit.dart';
import 'package:apkainzynierka/feature/profile_summary/ui/profile_summary_page.dart';
import 'package:apkainzynierka/feature/profile_summary/ui/profile_summary_view.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final container = ProfileSummaryContainer(context.read());

    return BlocProvider<ProfileSummaryCubit>(
      create: (context) => container.resolve(),
      child: BlocBuilder<ProfileSummaryCubit, Profile>(
        builder: (context, state) {
          return ProfileSummaryPage(
            body: ProfileSummaryView(
              model: state,
            ),
          );
        },
      ),
    );
  }
}

class ProfileSummaryContainer extends KiwiContainer {
  ProfileSummaryContainer(AppContainer appContainer) : super.scoped() {
    registerFactory((r) => ProfileSummaryCubit(r.resolve(), r.resolve()));
    registerFactory<ProfileRepository>(
        (r) => LocalProfileRepository(r.resolve()));
    registerInstance<BoxDatabase>(appContainer.resolve());
    registerInstance<EventBus>(appContainer.resolve());
  }
}
