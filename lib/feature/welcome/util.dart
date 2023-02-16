import 'package:apkainzynierka/domain/repository/profile_repository.dart';

class ShouldShowWelcomePage {
  final ProfileRepository _profileRepository;

  const ShouldShowWelcomePage(this._profileRepository);

  bool call() {
    return !_profileRepository.exists();
  }
}

