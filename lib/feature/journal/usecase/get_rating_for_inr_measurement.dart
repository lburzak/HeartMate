import 'package:apkainzynierka/domain/model/inr_measurement.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:apkainzynierka/feature/journal/model/day_summary.dart';

class GetRatingForInrMeasurement {
  final ProfileRepository _profileRepository;

  GetRatingForInrMeasurement(this._profileRepository);

  InrRating? call(InrMeasurement inrMeasurement) {
    final profile =
    _profileRepository.findForDateTime(inrMeasurement.reportDate);

    if (profile == null) {
      return null;
    }

    if (inrMeasurement.inr < profile.inrRange.from) {
      return InrRating.tooLow;
    }

    if (inrMeasurement.inr > profile.inrRange.to) {
      return InrRating.tooHigh;
    }

    return InrRating.balanced;
  }
}
