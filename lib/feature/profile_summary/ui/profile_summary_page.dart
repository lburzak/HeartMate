import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSummaryPage extends StatelessWidget {
  final Widget body;

  const ProfileSummaryPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
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
