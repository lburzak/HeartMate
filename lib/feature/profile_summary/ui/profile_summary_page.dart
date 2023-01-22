import 'package:apkainzynierka/feature/profile_summary/ui/profile_summary_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSummaryPage extends StatelessWidget {
  const ProfileSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ProfileSummaryView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {
          context.push("/profile/editor");
        },
      ),
    );
  }
}
