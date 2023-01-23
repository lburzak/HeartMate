import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:bloc/bloc.dart';

const placeholderProfile = Profile(
  anticoagulant: Anticoagulant.acenokumarol,
  inrRange: InrRange(from: 0, to: 0),
  otherMedicines: [],
);

class ProfileSummaryCubit extends Cubit<Profile> {
  final ProfileRepository _profileRepository;

  ProfileSummaryCubit(this._profileRepository) : super(placeholderProfile) {
    _fetchData();
  }

  void _fetchData() {
    final profile = _profileRepository.getCurrent();
    emit(profile);
  }
}
