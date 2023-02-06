import 'package:apkainzynierka/feature/last_inr_measurements/last_inr_measurements.dart';
import 'package:apkainzynierka/feature/report_inr/report_inr.dart';
import 'package:apkainzynierka/feature/today_dosage/today_dosage.dart';
import 'package:apkainzynierka/feature/today_note/today_note.dart';
import 'package:apkainzynierka/feature/week_preview/week_preview.dart';
import 'package:apkainzynierka/main.dart';
import 'package:apkainzynierka/widget/action_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TodayDosage(),
              const Padding(
                padding: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                child: WeekPreview(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionButton(
                  onPressed: () => context.push('/schedules/current'),
                  label: "Dostosuj harmonogram",
                  icon: Icons.calendar_month,
                ),
              ),
              const SizedBox(height: 150, child: LastInrMeasurements()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext _) {
                        return Provider<AppContainer>.value(
                            value: context.read(),
                            builder: (context, child) =>
                                const ReportInrDialog());
                      },
                    );
                  },
                  label: "Dodaj pomiar INR",
                  icon: Icons.bloodtype,
                ),
              ),
              const TodayNote()
            ],
          ),
        ),
      ),
    );
  }
}
