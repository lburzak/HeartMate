import 'package:apkainzynierka/data/adapter/registrable_adapter.dart';
import 'package:apkainzynierka/data/adapter/type_ids.dart';
import 'package:apkainzynierka/data/model/profile_entry.dart';
import 'package:hive/hive.dart';

class ProfileEntryAdapter extends RegistrableAdapter<ProfileEntry> {
  @override
  ProfileEntry read(BinaryReader reader) {
    final json = Map<String, Object?>.from(reader.readMap());
    return ProfileEntry.fromJson(json);
  }

  @override
  int get typeId => typeIdProfileEntry;

  @override
  void write(BinaryWriter writer, ProfileEntry obj) {
    writer.writeMap(obj.toJson());
  }
}
