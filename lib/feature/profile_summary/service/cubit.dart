import 'package:apkainzynierka/domain/event/profile_updated_event.dart';
import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:apkainzynierka/domain/repository/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:event_bus/event_bus.dart';

const placeholderProfile = Profile(
  anticoagulant: Anticoagulant.acenokumarol,
  inrRange: InrRange(from: 0, to: 0),
  otherMedicines: [],
);

class ProfileSummaryCubit extends Cubit<Profile> {
  final ProfileRepository _profileRepository;
  final EventBus _eventBus;

  ProfileSummaryCubit(this._profileRepository, this._eventBus)
      : super(placeholderProfile) {
    _fetchData();

    _eventBus.on<ProfileUpdatedEvent>().listen((event) {
      _fetchData();
    });
  }

  void _fetchData() {
    final profile = _profileRepository.getCurrent();
    emit(profile);
  }
}
