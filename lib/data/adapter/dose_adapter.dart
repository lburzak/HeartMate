import 'package:apkainzynierka/data/adapter/registrable_adapter.dart';
import 'package:apkainzynierka/data/adapter/type_ids.dart';
import 'package:apkainzynierka/domain/model/dose.dart';
import 'package:hive/hive.dart';

class DoseAdapter extends RegistrableAdapter<Dose> {
  @override
  Dose read(BinaryReader reader) {
    final json = Map<String, Object?>.from(reader.readMap());
    return Dose.fromJson(json);
  }

  @override
  int get typeId => typeIdDose;

  @override
  void write(BinaryWriter writer, Dose obj) {
    writer.writeMap(obj.toJson());
  }
}
