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
    if (profiles.isEmpty) {
      throw StateError("No profile");
    }

    final profile = profiles.getAt(0);

    if (profile == null) {
      throw StateError("No profile");
    }

    return profile;
  }

  @override
  void update(Profile profile) {
    if (profiles.isEmpty) {
      profiles.add(profile);
    } else {
      profiles.putAt(0, profile);
    }
  }

  @override
  bool exists() {
    return profiles.isNotEmpty;
  }

  @override
  Profile findForDateTime(DateTime dateTime) {
    // TODO: implement properly
    return getCurrent();
  }
}
