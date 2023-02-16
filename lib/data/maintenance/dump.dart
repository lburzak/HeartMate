import 'dart:convert';
import 'dart:io';

import 'package:apkainzynierka/data/adapter/dose_adapter.dart';
import 'package:apkainzynierka/data/adapter/inr_measurement_adapter.dart';
import 'package:apkainzynierka/data/adapter/inr_range_adapter.dart';
import 'package:apkainzynierka/data/adapter/profile_adapter.dart';
import 'package:apkainzynierka/data/adapter/profile_entry_adapter.dart';
import 'package:apkainzynierka/data/adapter/schedule_adapter.dart';
import 'package:apkainzynierka/data/database.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<Map<String, dynamic>> dumpData() async {
  final database = BoxDatabase([DoseAdapter(),
    ScheduleAdapter(),
    ProfileAdapter(),
    InrRangeAdapter(),
    InrMeasurementAdapter(),
    ProfileEntryAdapter()]);
  await database.initialize();
  return {
    "doses": database.dosesBox.values.map((e) => e.toJson()).toList(),
    "schedules": database.schedulesBox.values.map((e) => e.toJson()).toList(),
    "inrMeasurements":
        database.inrMeasurementsBox.values.map((e) => e.toJson()).toList(),
  };
}

Future<void> dumpToFile() async {
  final data = await dumpData();
  final path = await _localPath;
  final name = DateTime.now().toIso8601String();
  final file = File("$path/dump_$name.json");
  await file.writeAsString(jsonEncode(data));
}

void main() async {
  runApp(const DumpApp());
}

class DumpApp extends StatefulWidget {
  const DumpApp({super.key});

  @override
  State<DumpApp> createState() => _DumpAppState();
}

class _DumpAppState extends State<DumpApp> {
  bool dumped = false;

  @override
  void initState() {
    super.initState();

    dumpToFile().then((value) => setState(
          () {
            dumped = true;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Center(child: Text(dumped ? "Dump done!" : "Dumping...")));
  }
}
