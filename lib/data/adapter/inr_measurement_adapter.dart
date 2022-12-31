import 'package:apkainzynierka/data/adapter/type_ids.dart';
import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:hive/hive.dart';

class InrMeasurementAdapter extends TypeAdapter<InrMeasurement> {
  @override
  InrMeasurement read(BinaryReader reader) {
    final json = Map<String, dynamic>.from(reader.readMap());
    return InrMeasurement.fromJson(json);
  }

  @override
  int get typeId => typeIdInrMeasurement;

  @override
  void write(BinaryWriter writer, InrMeasurement obj) {
    writer.writeMap(obj.toJson());
  }
}
