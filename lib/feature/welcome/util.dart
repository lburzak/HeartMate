import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_profile_repository.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/main.dart';
import 'package:kiwi/kiwi.dart';

class ShouldShowWelcomePage {
  final ProfileRepository _profileRepository;

  ShouldShowWelcomePage(AppContainer appContainer)
      : _profileRepository =
            ShouldShowWelcomePageContainer(appContainer: appContainer)
                .resolve();

  bool call() {
    return !_profileRepository.exists();
  }
}

class ShouldShowWelcomePageContainer extends KiwiContainer {
  ShouldShowWelcomePageContainer({required AppContainer appContainer})
      : super.scoped() {
    registerFactory<ProfileRepository>(
        (r) => LocalProfileRepository(r.resolve()));
    registerInstance<BoxDatabase>(appContainer.resolve());
  }
}
