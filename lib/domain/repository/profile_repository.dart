import 'package:apkainzynierka/domain/model/profile.dart';

abstract class ProfileRepository {
  Profile getCurrent();

  Profile? findForDateTime(DateTime dateTime);

  void update(Profile profile);

  bool exists();
}
