import 'package:apkainzynierka/data/adapter/type_ids.dart';
import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:hive/hive.dart';

class DoseAdapter extends TypeAdapter<Dose> {
  @override
  Dose read(BinaryReader reader) {
    final json = reader.readMap() as Map<String, Object?>;
    return Dose.fromJson(json);
  }

  @override
  int get typeId => typeIdDose;

  @override
  void write(BinaryWriter writer, Dose obj) {
    writer.writeMap(obj.toJson());
  }
}
