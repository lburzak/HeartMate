import 'package:apkainzynierka/domain/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entry.freezed.dart';
part 'profile_entry.g.dart';

@freezed
class ProfileEntry with _$ProfileEntry {
  const factory ProfileEntry({
    required DateTime createdAt,
    required Profile profile,
  }) = _ProfileEntry;

  factory ProfileEntry.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntryFromJson(json);
}
