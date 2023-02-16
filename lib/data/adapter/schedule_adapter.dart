import 'package:apkainzynierka/data/adapter/registrable_adapter.dart';
import 'package:apkainzynierka/data/adapter/type_ids.dart';
import 'package:apkainzynierka/domain/model/schedule.dart';
import 'package:hive/hive.dart';

class ScheduleAdapter extends RegistrableAdapter<Schedule> {
  @override
  int get typeId => typeIdSchedule;

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer.writeMap(obj.toJson());
  }

  @override
  Schedule read(BinaryReader reader) {
    final json = Map<String, Object?>.from(reader.readMap());
    return Schedule.fromJson(json);
  }
}
