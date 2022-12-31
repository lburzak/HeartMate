import 'package:apkainzynierka/data/adapter/type_ids.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:hive/hive.dart';

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  Profile read(BinaryReader reader) {
    final json = Map<String, Object?>.from(reader.readMap());
    return Profile.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer.writeMap(obj.toJson());
  }

  @override
  int get typeId => typeIdProfile;
}
