import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:hive/hive.dart';

class LocalProfileRepository extends ProfileRepository {
  final Box<Profile> profiles;

  LocalProfileRepository(BoxDatabase database)
      : profiles = database.profilesBox;

  @override
  Profile getCurrent() {
    final profile = profiles.getAt(0);

    if (profile == null) {
      throw StateError("No profile");
    }

    return profile;
  }

  @override
  void update(Profile profile) {
    profiles.putAt(0, profile);
  }
}
