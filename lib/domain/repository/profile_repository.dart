import 'package:apkainzynierka/domain/model/profile.dart';

abstract class ProfileRepository {
  Profile getCurrent();

  void update(Profile profile);

  bool exists();
}
