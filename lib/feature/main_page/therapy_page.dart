import 'package:apkainzynierka/feature/last_inr_measurements/last_inr_measurements.dart';
import 'package:apkainzynierka/feature/report_inr/report_inr.dart';
import 'package:apkainzynierka/feature/today_dosage/today_dosage.dart';
import 'package:apkainzynierka/main.dart';
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
      child: Column(
        children: [
          const TodayDosage(),
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    7,
                    (index) => Column(children: const [
                          Text("Pn"),
                          SizedBox(
                            height: 5,
                          ),
                          DailyDosageCircle()
                        ]))),
          )),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox.expand(
                  child: ElevatedButton(
                      onPressed: () => context.push('/schedules/current'),
                      child: const Text("Dostosuj harmonogram"))),
            ),
          ),
          const SizedBox(height: 150, child: LastInrMeasurements()),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox.expand(
                  child: ElevatedButton(
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
                      child: const Text("Dodaj pomiar INR"))),
            ),
          ),
        ],
      ),
    );
  }
}

class DailyDosageCircle extends StatelessWidget {
  const DailyDosageCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 50,
      child: Material(
        shape: CircleBorder(
            side: BorderSide(
          color: Colors.green,
          width: 2,
        )),
        child: Center(child: Text('1.5')),
      ),
    );
  }
}
