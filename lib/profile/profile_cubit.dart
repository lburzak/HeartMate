import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../util/range.dart';
import 'medicine.dart';
import 'notifications_mode.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  void save() {}
}
