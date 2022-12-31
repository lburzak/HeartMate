import 'package:apkainzynierka/data/adapter/dose_adapter.dart';
import 'package:apkainzynierka/data/adapter/schedule_adapter.dart';
import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/domain/model/schedule.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _boxNameDoses = "doses";
const _boxNameSchedules = "schedules";
const _boxNameLastIds = "lastIds";
const _boxNameInrMeasurements = "inrMeasurements";
const _boxNameProfiles = "profiles";

class BoxDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DoseAdapter());
    Hive.registerAdapter(ScheduleAdapter());
    await Hive.openBox<Dose>(_boxNameDoses);
    await Hive.openBox<Schedule>(_boxNameSchedules);
    await Hive.openBox<int>(_boxNameLastIds);
    await Hive.openBox<Profile>(_boxNameProfiles);
    await Hive.openBox<InrMeasurement>(_boxNameInrMeasurements);
  }

  Box<Dose> get dosesBox => Hive.box<Dose>(_boxNameDoses);

  Box<Schedule> get schedulesBox => Hive.box<Schedule>(_boxNameSchedules);

  Box<InrMeasurement> get inrMeasurementsBox =>
      Hive.box<InrMeasurement>(_boxNameInrMeasurements);

  Box<int> get lastIdsBox => Hive.box<int>(_boxNameLastIds);

  Box<Profile> get profilesBox => Hive.box<Profile>(_boxNameProfiles);

  int getNextId(Type type) {
    final key = type.toString();

    final lastId = lastIdsBox.get(key) ?? 0;
    final nextId = lastId + 1;

    lastIdsBox.put(key, nextId);

    return nextId;
  }
}
