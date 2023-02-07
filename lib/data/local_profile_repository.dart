import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/model/profile_entry.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:hive/hive.dart';

class LocalProfileRepository extends ProfileRepository {
  final Box<ProfileEntry> profiles;

  LocalProfileRepository(BoxDatabase database)
      : profiles = database.profilesBox;

  @override
  Profile getCurrent() {
    if (profiles.isEmpty) {
      throw StateError("No profile");
    }

    final now = DateTime.now();
    final profile = findForDateTime(now);

    if (profile == null) {
      throw StateError("No profile");
    }

    return profile;
  }

  @override
  void update(Profile profile) {
    final now = DateTime.now();
    profiles.add(ProfileEntry(createdAt: now, profile: profile));
  }

  @override
  bool exists() {
    final now = DateTime.now();
    return profiles.values.any((element) => element.createdAt.isBefore(now));
  }

  @override
  Profile? findForDateTime(DateTime dateTime) {
    Profile? candidate;

    for (ProfileEntry entry in profiles.values) {
      if (entry.createdAt.isBefore(dateTime)) {
        candidate = entry.profile;
      }
    }

    return candidate;
  }
}
