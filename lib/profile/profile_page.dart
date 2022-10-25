import 'package:apkainzynierka/profile/notification_manager.dart';
import 'package:apkainzynierka/profile/profile_cubit.dart';
import 'package:apkainzynierka/profile/profile_view.dart';
import 'package:apkainzynierka/profile/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => UserPreferences()),
        Provider(create: (_) => NotificationManager())
      ],
      builder: (context, child) => BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) => ProfileView(state: state),
          bloc: ProfileCubit(context.read(), context.read())),
    );
  }
}
