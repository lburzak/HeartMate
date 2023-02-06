// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileEntry _$$_ProfileEntryFromJson(Map<String, dynamic> json) =>
    _$_ProfileEntry(
      createdAt: DateTime.parse(json['createdAt'] as String),
      profile: json['profile'],
    );

Map<String, dynamic> _$$_ProfileEntryToJson(_$_ProfileEntry instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'profile': instance.profile,
    };
