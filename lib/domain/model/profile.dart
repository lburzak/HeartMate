import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/domain/model/inr_range.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile(
      {String? firstName,
      String? lastName,
      int? height,
      int? weight,
      int? age,
      Gender? gender,
      Illness? illness,
      required Anticoagulant anticoagulant,
      required InrRange inrRange,
      required List<String> otherMedicines}) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
