import 'package:apkainzynierka/today_dosage/today_dosage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

class TherapyPage extends StatefulWidget {
  const TherapyPage({super.key});

  @override
  State<TherapyPage> createState() => _TherapyPageState();
}

class _TherapyPageState extends State<TherapyPage> {
  late final KiwiContainer dailyDosageContainer;

  @override
  void initState() {
    super.initState();
    dailyDosageContainer = buildTodayDosageContainer(context, context.read());
  }

  @override
  Widget build(BuildContext context) {
    return const TodayDosage();
  }
}
