import 'package:apkainzynierka/data/adapter/registrable_adapter.dart';
import 'package:apkainzynierka/data/model/profile_entry.dart';
import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/model/schedule.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _boxNameDoses = "doses";
const _boxNameSchedules = "schedules";
const _boxNameLastIds = "lastIds";
const _boxNameInrMeasurements = "inrMeasurements";
const _boxNameProfiles = "profiles";
const _boxNameNotificationSettings = "notificationSettings";
const _boxNameNotes = "notes";

class BoxDatabase {
  final List<RegistrableAdapter<dynamic>> adapters;

  BoxDatabase(this.adapters);

  Future<void> initialize() async {
    for (final adapter in adapters) {
      adapter.safeRegister();
    }

    await Hive.initFlutter();

    dosesBox = await safeOpenBox<Dose>(_boxNameDoses);
    schedulesBox = await safeOpenBox<Schedule>(_boxNameSchedules);
    lastIdsBox = await safeOpenBox<int>(_boxNameLastIds);
    profilesBox = await safeOpenBox<ProfileEntry>(_boxNameProfiles);
    inrMeasurementsBox = await safeOpenBox<InrMeasurement>(_boxNameInrMeasurements);
    notificationSettingsBox = await safeOpenBox<int>(_boxNameNotificationSettings);
    notesBox = await safeOpenBox<String>(_boxNameNotes);
  }

  static Future<Box<T>> safeOpenBox<T>(String boxName) async {
    return Hive.openBox<T>(boxName);
  }

  late final Box<Dose> dosesBox;
  late final Box<Schedule> schedulesBox;
  late final Box<InrMeasurement> inrMeasurementsBox;
  late final Box<int> lastIdsBox;
  late final Box<ProfileEntry> profilesBox;
  late final Box<int> notificationSettingsBox;
  late final Box<String> notesBox;

  int getNextId(Type type) {
    final key = type.toString();

    final lastId = lastIdsBox.get(key) ?? 0;
    final nextId = lastId + 1;

    lastIdsBox.put(key, nextId);

    return nextId;
  }
}
