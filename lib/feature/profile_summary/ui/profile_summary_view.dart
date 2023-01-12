import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/feature/profile_editor/model/state.dart';
import 'package:apkainzynierka/feature/profile_editor/service/cubit.dart';
import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
import 'package:flutter/material.dart';

class ProfileSummaryView extends StatelessWidget {
  const ProfileSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
     SafeArea(
       child: Header(
          text: 'Imie nazwisko',
        ),
     ),
    ]);
  }
}
