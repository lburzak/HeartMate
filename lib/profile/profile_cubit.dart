import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'medicine.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  void save() {}
}
