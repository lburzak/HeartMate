import 'package:apkainzynierka/profile/profile_cubit.dart';
import 'package:apkainzynierka/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => ProfileView(state: state),
        bloc: ProfileCubit());
  }
}
