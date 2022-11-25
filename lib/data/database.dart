import 'package:apkainzynierka/data/adapter/dose_adapter.dart';
import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _boxNameDoses = "doses";

class BoxDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DoseAdapter());
    await Hive.openBox<Dose>(_boxNameDoses);
  }

  Box<Dose> get dosesBox => Hive.box<Dose>(_boxNameDoses);
}
