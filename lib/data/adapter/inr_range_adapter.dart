import 'package:apkainzynierka/data/adapter/registrable_adapter.dart';
import 'package:apkainzynierka/data/adapter/type_ids.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:hive/hive.dart';

class InrRangeAdapter extends RegistrableAdapter<InrRange> {
  @override
  int get typeId => typeIdInrRange;

  @override
  void write(BinaryWriter writer, InrRange obj) {
    writer.writeMap(obj.toJson());
  }

  @override
  InrRange read(BinaryReader reader) {
    final json = Map<String, dynamic>.from(reader.readMap());
    return InrRange.fromJson(json);
  }
}
