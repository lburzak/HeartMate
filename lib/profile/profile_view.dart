import 'package:apkainzynierka/profile/profile_cubit.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final ProfileState state;

  const ProfileView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return const Text("Profile");
  }
}
